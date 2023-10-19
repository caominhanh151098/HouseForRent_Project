package com.example.casestudy_hotelproject.repository;

import com.example.casestudy_hotelproject.model.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Integer> {
    Optional<Payment> findByIdAndTxnRef(int paymentId, String txnRef);

    Optional<Payment> findByIdAndTransactionNo(int paymentId, String TransactionNo);
}
