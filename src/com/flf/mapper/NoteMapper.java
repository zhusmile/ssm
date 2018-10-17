package com.flf.mapper;

import com.flf.entity.Note;

public interface NoteMapper {
	//获取note
	Note getNote();
	//修改note
	void updateNote(Note note);
}
