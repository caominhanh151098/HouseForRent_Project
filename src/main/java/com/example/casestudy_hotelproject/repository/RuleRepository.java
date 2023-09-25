package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Rule;
import com.example.casestudy_hotelproject.model.RuleHouse;
import com.example.casestudy_hotelproject.model.enums.TypeInput;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RuleRepository extends JpaRepository<Rule, Integer> {
    Rule findById(int id);
    List<Rule> findByInput(TypeInput input);
}
