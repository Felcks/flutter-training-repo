package com.capivara.bolao.api

import com.capivara.bolao.model.Championship
import com.capivara.bolao.service.ChampionshipService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RequestMapping("api/v1/championship")
@RestController
class ChampionshioController @Autowired constructor(val championshipService: ChampionshipService) {

    @GetMapping
    fun getAllChampionship(): List<Championship>{
        return championshipService.getAllChampionship()
    }
}