package com.example.demo.service

import com.example.demo.dao.PersonDao
import com.example.demo.model.Person
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Qualifier
import org.springframework.stereotype.Service
import java.util.*

@Service
class PersonService @Autowired constructor(@Qualifier("fakeDao") val personDao: PersonDao) {

    fun addPerson(person: Person): Person{
        return personDao.insertPerson(person);
    }

    fun getAllPeople(): List<Person>{
        return personDao.selectAllPeople();
    }

    fun getPersonById(id: UUID): Person?{
        return personDao.selectPersonById(id)
    }

    fun deletePersonById(id: UUID): Int{
        return personDao.deletePersonById(id)
    }

    fun updatePersonById(id: UUID, person: Person): Int{
        return personDao.updatePersonById(id, person)
    }
}