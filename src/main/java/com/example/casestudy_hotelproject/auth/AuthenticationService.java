package com.example.casestudy_hotelproject.auth;

import com.example.casestudy_hotelproject.config.JwtService;
import com.example.casestudy_hotelproject.model.User;
import com.example.casestudy_hotelproject.model.enums.Role;
import com.example.casestudy_hotelproject.repository.UserRepository;
import com.example.casestudy_hotelproject.service.authentication.request.AuthenticationRequest;
import com.example.casestudy_hotelproject.service.authentication.response.AuthenticationResponse;
import com.example.casestudy_hotelproject.service.authentication.request.RegisterRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AuthenticationService {
    private final UserRepository userRepository;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;
    private final UserDetailsService userDetailsService;
    private final PasswordEncoder passwordEncoder;

    public AuthenticationResponse register(RegisterRequest request) {
        String phone = "+84" + request.getPhone();
        if (userRepository.findByEmail(request.getEmail()).isPresent() || userRepository.findByPhone(phone).isPresent()) {
            return null;
        }
        User user = null;
        String uuid = UUID.randomUUID().toString();
        try {
            user = User.builder()
                    .email(request.getEmail())
                    .phone(phone)
                    .firstName(request.firstName)
                    .lastName(request.lastName)
                    .uuid(uuid)
                    .password(passwordEncoder.encode(uuid))
                    .dob(new SimpleDateFormat("yyyy-MM-dd").parse(request.getDob()))
                    .createDate(LocalDate.now())
                    .role(Role.GUEST)
                    .status(true)
                    .build();
        } catch (ParseException e) {
            return null;
        }
        userRepository.save(user);
        var jwtToken = jwtService.generateToken(user);
        return AuthenticationResponse.builder()
                .token(jwtToken)
                .build();

    }

    public AuthenticationResponse authentication(AuthenticationRequest request) {
        var user = userRepository.findUserByEmailOrPhone(request.getValue(), request.getValue()).orElseThrow();
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        user.getEmail(),
                        user.getUuid()
                )
        );
        var jwtToken = jwtService.generateToken(user);
        return AuthenticationResponse.builder()
                .token(jwtToken)
                .build();
    }

    public boolean checkUserExist(AuthenticationRequest request) {
        var user = userRepository.findUserByEmailOrPhone(request.getValue(), request.getValue());
        return user.isPresent() ? true : false;
    }
}
