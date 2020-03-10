package com.example.demo.dao

import com.example.demo.model.Person
import org.springframework.stereotype.Repository
import java.util.*

@Repository("fakeDao")
class FakePersonDataAccessService: PersonDao {

    companion object{
        private val DB: MutableList<Person> = mutableListOf()
    }

    override fun insertPerson(id: UUID, person: Person): Int {
        DB.add(Person(id, person.name))
        println(person.name)
        return 1
    }

    override fun insertPerson(person: Person): Int {
        return super.insertPerson(person)
    }

    override fun selectAllPeople(): List<Person> {
        return DB;
    }
}