package com.capivara.bolao.dao

import com.capivara.bolao.model.Team
import org.springframework.stereotype.Repository
import java.util.*

@Repository("teamHardDAO")
class TeamDAOHardImpl: TeamDAO {

    companion object{
        val teamList: MutableList<Team> = mutableListOf()
    }

    override fun insertTeam(id: UUID, team: Team): Team {
        val t = team.apply { this.id = id }
        teamList.add(t)
        return t
    }

    override fun insertTeam(user: Team): Team {
        return super.insertTeam(user)
    }

    override fun getAllTeam(): List<Team> {
        return teamList
    }

    override fun selectTeamById(id: UUID): Team? {
        return teamList.firstOrNull { it.id == id }
    }

    override fun selectTeamByName(name: String): Team? {
        return teamList.firstOrNull { it.name.equals(name, true) }
    }

    override fun updateTeam(id: UUID, team: Team): Int {
        selectTeamById(id).also {
            val index = teamList.indexOf(it)
            if (index >= 0) {
                teamList[index] = team.apply { this.id = id }
                return 1;
            }
        }
        return 0
    }
}