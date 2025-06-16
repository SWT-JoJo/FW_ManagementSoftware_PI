package com.example.PIProjektBackEnd.reposetory;

import com.example.PIProjektBackEnd.model.Uebungsdienst;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface UebungsdienstRepository extends CrudRepository<Uebungsdienst,Integer> {

    List<Uebungsdienst> findBystartBetween(LocalDateTime startOfDay, LocalDateTime endOfDay);
}
