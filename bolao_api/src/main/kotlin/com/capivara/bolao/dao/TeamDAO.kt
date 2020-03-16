package com.capivara.bolao.dao

import com.capivara.bolao.model.Team
import java.util.*

interface TeamDAO {

    fun insertTeam(id: UUID, team: Team): Team

    fun insertTeam(user: Team): Team {
        val id: UUID = UUID.randomUUID()
        return insertTeam(id, user)
    }

    fun getAllTeam(): List<Team>

    fun selectTeamById(id: UUID): Team?

    fun selectTeamByName(name: String): Team?

    fun updateTeam(id: UUID, team: Team): Int
}