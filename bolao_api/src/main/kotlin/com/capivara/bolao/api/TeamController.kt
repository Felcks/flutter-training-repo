package com.capivara.bolao.api

import com.capivara.bolao.model.Team
import com.capivara.bolao.service.TeamService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.lang.NonNull
import org.springframework.web.bind.annotation.*
import java.util.*
import javax.validation.Valid

@RequestMapping("api/v1/team")
@RestController
class TeamController @Autowired constructor(val teamService: TeamService){

    @PostMapping
    fun postTeam(@Valid @NonNull @RequestBody team: Team): Team{
        return teamService.addTeam(team)
    }

    @GetMapping
    fun getAllTeam(@RequestParam("name") name: String?): List<Team?>?{
        if(name != null)
         return listOf(teamService.getTeamByName(name))
        else
            return teamService.getAllTeam()
    }

    @GetMapping(path = ["{id}"])
    fun getTeamById(@PathVariable("id") id: UUID): Team?{
        return teamService.getTeamById(id)
    }
}
