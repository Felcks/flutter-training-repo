package com.capivara.bolao.service

import com.capivara.bolao.dao.ChampionshipDAO
import com.capivara.bolao.model.Championship
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.stereotype.Service

@Service
class ChampionshipService @Autowired constructor(@Qualifier("hardDAO") val championshipDAO: ChampionshipDAO) {

    fun getAllChampionship(): List<Championship>{
        return championshipDAO.selectAllChampionship()
    }
}