package com.example.demo.dao

import com.example.demo.model.Person
import java.util.*

interface PersonDao {

    fun insertPerson(id: UUID, person: Person): Person

    fun insertPerson(person: Person): Person {
        val id: UUID = UUID.randomUUID()
        return insertPerson(id, person)
    }

    fun selectAllPeople(): List<Person>

    fun selectPersonById(id: UUID): Person?

    fun deletePersonById(id: UUID): Int

    fun updatePersonById(id: UUID, person: Person): Int
}