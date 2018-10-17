package com.flf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.flf.entity.Note;
import com.flf.service.NoteService;

@Controller
@RequestMapping(value="/note")
public class NoteController {
	@Autowired
	private NoteService noteService;
	@RequestMapping
	public ModelAndView getNote() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("noteAdmin/notes");
		Note note=noteService.getNote();
		System.out.println(note.getnContent());
		mv.addObject("note", noteService.getNote());
		return mv;
	}
	@RequestMapping(value="/toUpdateNote")
	public ModelAndView toEditNote() {
		System.out.println("update");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("noteAdmin/note_info");
		Note note=noteService.getNote();
		System.out.println(note.getnContent());
		mv.addObject("note", noteService.getNote());
		return mv;
	}
	@RequestMapping(value="/save")
	public ModelAndView save(Note note) {
		ModelAndView mv = new ModelAndView();
		note.setnId(1);
		noteService.updateNote(note);
		System.out.println(note.getnContent());
		mv.setViewName("save_result");
		return mv;
	}
}
