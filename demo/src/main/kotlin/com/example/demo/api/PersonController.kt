package com.example.demo.api

import com.example.demo.model.Person
import com.example.demo.service.PersonService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*
import java.util.*

@RequestMapping("api/v1/person")
@RestController
class PersonController @Autowired constructor(val personService: PersonService) {

    @PostMapping
    fun addPerson(@RequestBody person: Person){
        personService.addPerson(person);
    }

    @GetMapping
    fun getAllPeople(): List<Person>{
        return personService.getAllPeople()
    }

    @GetMapping(path = ["{id}"])
    fun getPersonById(@PathVariable("id") id: UUID): Person?{
        return personService.getPersonById(id)
    }

    @DeleteMapping(path = ["{id}"])
    fun deletePersonById(@PathVariable("id") id: UUID) {
        personService.deletePersonById(id)
    }

    @PutMapping(path = ["{id}"])
    fun putPersonById(@PathVariable("id") id: UUID, @RequestBody personToUpdate: Person){
        personService.updatePersonById(id, personToUpdate)
    }
}