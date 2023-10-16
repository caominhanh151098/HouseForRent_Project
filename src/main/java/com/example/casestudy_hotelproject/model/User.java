package com.example.casestudy_hotelproject.model;

import com.example.casestudy_hotelproject.model.enums.Role;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDate;
import java.util.*;

@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String uuid;
    @Column(nullable = false)
    private String firstName;
    @Column(nullable = false)
    private String lastName;
    private String avatar;
    @Column(nullable = false)
    private String email;
    @Column(nullable = false)
    private String phone;
    private Date dob;
    @Enumerated(EnumType.STRING)
    private Role role;
    private boolean status;
    private LocalDate createDate = LocalDate.now();
    private String password;
    private String reasonPDF;
    private boolean verifyEmail;

    @OneToMany(mappedBy = "user")
    private List<House> hotels;

    @OneToMany(mappedBy = "user")
    private List<EmergencyContact> emergencyContacts;

    @OneToMany(mappedBy = "user")
    private List<FavoritesList> favoritesLists;

    @OneToMany(mappedBy = "user")
    private List<Review> reviews;

    @OneToMany(mappedBy = "user")
    private List<Reservation> reservations;

    @OneToOne
    @JsonIgnore
    @JoinColumn(name = "address_Id")
    private AddressUser addressUser;

    @OneToOne
    @JoinColumn(name = "identity_Paper_Id")
    private IdentityPaper identity;

    @OneToMany(mappedBy = "user")
    private List<InterestDetail> interestDetails;

    @OneToOne
    @JoinColumn(name = "profile_Id")
    private Profile profile;

    public User(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "";
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority(role.name()));
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
