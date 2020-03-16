package com.capivara.bolao.service

import com.capivara.bolao.dao.TeamDAO
import com.capivara.bolao.model.Team
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.stereotype.Service
import java.util.*

@Service
class TeamService @Autowired constructor(@Qualifier("teamHardDAO") val teamDAO: TeamDAO) {

    fun addTeam(team: Team): Team{
        return teamDAO.insertTeam(team)
    }

    fun getAllTeam(): List<Team>{
        return teamDAO.getAllTeam()
    }

    fun getTeamByName(name: String): Team?{
        return teamDAO.selectTeamByName(name)
    }

    fun getTeamById(id: UUID): Team?{
        return teamDAO.selectTeamById(id)
    }
}