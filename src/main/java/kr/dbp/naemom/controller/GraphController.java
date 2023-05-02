package kr.dbp.naemom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.dbp.naemom.service.GraphService;

@Controller
public class GraphController {


	@Autowired
	GraphService graphService;
  
}
