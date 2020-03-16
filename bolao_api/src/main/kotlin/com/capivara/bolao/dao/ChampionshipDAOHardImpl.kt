package com.capivara.bolao.dao

import com.capivara.bolao.model.*
import org.springframework.stereotype.Repository
import java.time.LocalDateTime
import java.time.ZoneId
import java.time.ZonedDateTime
import java.util.*

@Repository("hardDAO")
class ChampionshipDAOHardImpl : ChampionshipDAO {

    companion object {
        private val championshipList: MutableList<Championship> = mutableListOf()
    }

    init {

        val championshipID: UUID = UUID.randomUUID()

        val flamengo = Team(UUID.randomUUID(), "Flamengo", "https://ssl.gstatic.com/onebox/media/sports/logos/orE554NToSkH6nuwofe7Yg_96x96.png")
        val portuguesa = Team(UUID.randomUUID(), "Portuguesa", "https://ssl.gstatic.com/onebox/media/sports/logos/IvRu9o7LgtB-oRBZDb319w_96x96.png")

        val flamengoGameTeam = GameTeam(UUID.randomUUID(), flamengo, 0)
        val portuguesaGameTeam = GameTeam(UUID.randomUUID(), portuguesa, 0)

        val game = Game(UUID.randomUUID(), championshipID, 0, flamengoGameTeam, portuguesaGameTeam)

        val round = Round(0, championshipID, LocalDateTime.now().plusHours(1).atZone(ZoneId.of("America/Sao_Paulo")), listOf(game))

        val championship = Championship(championshipID, "Brasileirão", "2020",
                0, 0, "https://upload.wikimedia.org/wikipedia/pt/thumb/4/42/Campeonato_Brasileiro_S%C3%A9rie_A_logo.png/170px-Campeonato_Brasileiro_S%C3%A9rie_A_logo.png", listOf(round))

        val championship2 = Championship(championshipID, "Copa do Brasil", "2020",
                0, 0, "https://app.globoesporte.globo.com/futebol/copa-do-brasil/uma-taca-dificil-de-levar-pra-casa/assets/images/taca-360-768/taca_360_01.jpg", listOf(round))

        championshipList.add(championship)
        championshipList.add(championship2)
    }

    override fun selectAllChampionship(): List<Championship> {
        return championshipList.toList()
    }
}