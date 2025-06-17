package com.example.PIProjektBackEnd.reposetory;

import com.example.PIProjektBackEnd.model.Einsatz;
import org.apache.catalina.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface EinsatzRepository extends CrudRepository<Einsatz, Integer> {

}
