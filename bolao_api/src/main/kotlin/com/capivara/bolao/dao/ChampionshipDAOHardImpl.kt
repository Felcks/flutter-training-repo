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

        val flamengo = Team(1, "Flamengo", "a")
        val portuguesa = Team(2, "Goias", "a")

        val flamengoGameTeam = GameTeam(UUID.randomUUID(), flamengo, 0)
        val portuguesaGameTeam = GameTeam(UUID.randomUUID(), portuguesa, 0)

        val game = Game(UUID.randomUUID(), championshipID, 0, flamengoGameTeam, portuguesaGameTeam)

        val round = Round(0, championshipID, LocalDateTime.now().plusHours(1).atZone(ZoneId.of("America/Sao_Paulo")), listOf(game))

        val championship = Championship(championshipID, "Brasileirão", "2020",
                0, 0, "https://upload.wikimedia.org/wikipedia/pt/c/cc/Trof%C3%A9u_Brasileir%C3%A3o_2019.png", listOf(round))

        championshipList.add(championship)
    }

    override fun selectAllChampionship(): List<Championship> {
        return championshipList.toList()
    }
}