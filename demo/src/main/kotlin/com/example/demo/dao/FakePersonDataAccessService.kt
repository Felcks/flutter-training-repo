package com.example.demo.dao

import com.example.demo.model.Person
import org.springframework.stereotype.Repository
import java.util.*

@Repository("fakeDao")
class FakePersonDataAccessService : PersonDao {

    companion object {
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

    override fun selectPersonById(id: UUID): Person? {
        return DB.first { it.id?.equals(id) == true }
    }

    override fun deletePersonById(id: UUID): Int {
        val person = selectPersonById(id)
        DB.remove(person)
        return 1;
    }

    override fun updatePersonById(id: UUID, person: Person): Int {
        selectPersonById(id).also {
            val index = DB.indexOf(it)
            if(index >= 0){
                DB[index] = person.apply { this.id = id }
                return 1;
            }
        }
        return 0
    }
}