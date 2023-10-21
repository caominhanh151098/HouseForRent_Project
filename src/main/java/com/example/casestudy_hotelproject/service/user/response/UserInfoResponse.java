package com.example.casestudy_hotelproject.service.user.response;

import com.example.casestudy_hotelproject.model.AddressUser;
import com.example.casestudy_hotelproject.model.IdentityPaper;
import com.example.casestudy_hotelproject.model.enums.Role;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserInfoResponse {
    public int id;
    public String email;
    public String firstName;
    public String lastName;
    public String phone;
    public AddressUser addressUser;
    public String address;
    public String avatar;
    public IdentityPaper identity;
    public Role role;
}
