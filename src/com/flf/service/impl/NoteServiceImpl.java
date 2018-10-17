package com.flf.service.impl;

import com.flf.entity.Note;
import com.flf.mapper.NoteMapper;
import com.flf.service.NoteService;

public class NoteServiceImpl implements NoteService {
	private NoteMapper noteMapper;
	
	public NoteMapper getNoteMapper() {
		return noteMapper;
	}

	public void setNoteMapper(NoteMapper noteMapper) {
		this.noteMapper = noteMapper;
	}

	@Override
	public Note getNote() {
		// TODO Auto-generated method stub
		return noteMapper.getNote();
	}

	@Override
	public void updateNote(Note note) {
		// TODO Auto-generated method stub
		noteMapper.updateNote(note);
	}

}
