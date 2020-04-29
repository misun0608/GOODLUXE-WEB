package com.spring.goodluxe.jj;

import org.springframework.web.multipart.MultipartFile;

public class Request2Model {
	
	private MultipartFile file_1;
	private MultipartFile file_2;

	public MultipartFile getFile_1() {
		return file_1;
	}
	public MultipartFile getFile_2() {
		return file_2;
	}

	public void setFile_1(MultipartFile file_1) {
		this.file_1 = file_1;
	}
	public void setFile_2(MultipartFile file_2) {
		this.file_2 = file_2;
	}

	
	
	/* MultipartFile mf = model.getFile();
		String uploadPath = "C:\\Project138\\upload\\";
		String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
		String storedFileName = UUID.randomUUID().toString().replace("-", "") + originalFileExtension;
		
		if(mf.getSize() != 0) {
			mf.transferTo(new File(uploadPath + storedFileName));
		}
		
		boardVO.setBOARD_ORI_FILE(mf.getOriginalFilename());
		boardVO.setBOARD_STORED_FILE(storedFileName);
		
		boardService.boardInsert(boardVO);
		 */
	
}
