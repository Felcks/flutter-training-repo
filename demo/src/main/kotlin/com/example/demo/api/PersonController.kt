package com.example.demo.api

import com.example.demo.model.Person
import com.example.demo.service.PersonService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

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
}