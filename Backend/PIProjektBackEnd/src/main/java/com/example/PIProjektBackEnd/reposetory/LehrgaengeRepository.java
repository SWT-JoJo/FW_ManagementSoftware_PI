package com.example.PIProjektBackEnd.reposetory;

import com.example.PIProjektBackEnd.model.Lehrgang;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LehrgaengeRepository extends CrudRepository<Lehrgang,Integer> {
}
