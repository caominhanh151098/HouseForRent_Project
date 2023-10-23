package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.CancellationPolicyDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CancellationPolicyDetailRepository extends JpaRepository<CancellationPolicyDetail,Integer> {
}
