package com.example.produkty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin(origins = "http://localhost:3000/")

@RestController
public class Controller {

    @Autowired
    Repository repo;

    @GetMapping("shop")
    public List<Shop> getproducts(){
        return repo.findAll();
    }
}
