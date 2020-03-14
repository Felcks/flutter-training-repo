package com.capivara.bolao.dao

import com.capivara.bolao.model.Championship

interface ChampionshipDAO {

    fun selectAllChampionship(): List<Championship>
}