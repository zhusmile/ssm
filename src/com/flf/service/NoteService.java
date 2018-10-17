package com.flf.service;

import com.flf.entity.Note;

public interface NoteService {
	//获取note
	Note getNote();
	//修改note
	void updateNote(Note note);
}
