package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.CancellationPolicyList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CancellationPolicyListRepository extends JpaRepository<CancellationPolicyList, Integer> {
}
