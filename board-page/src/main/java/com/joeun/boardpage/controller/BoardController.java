package com.joeun.boardpage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joeun.boardpage.dto.Board;
import com.joeun.boardpage.dto.Page;
import com.joeun.boardpage.service.BoardService;

import lombok.extern.slf4j.Slf4j;

/**
 * 게시판 컨트롤러
 * - 게시글 목록 - [GET] - /board/list
 * - 게시글 조회 - [GET] - /board/read
 * - 게시글 등록 - [GET] - /board/insert
 * - 게시글 등록 처리 - [POST] - /board/insert
 * - 게시글 수정 - [GET] - /board/update
 * - 게시글 수정 처리 - [POST] - /board/update
 * - 게시글 삭제 처리 - [POST] - /board/delete
 */
@Slf4j // 로그 사용 어노테이션
@Controller
@RequestMapping("/board")
public class BoardController {

    // 한꺼번에 import : alt + shift + O
    @Autowired
    private BoardService boardService;

    @GetMapping()
    public ResponseEntity<?> getAll(Page page) {
        log.info("컨트롤러의 페이지는?"+page.toString());
        try {
            List<Board> boardList = boardService.list(page);
            Map<String, Object> map = new HashMap<>();
            map.put("list", boardList);
            map.put("page", page);
            return new ResponseEntity<>(map, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/{no}")
    public ResponseEntity<?> getOne(@PathVariable Integer no) {
        try {
            Board board = boardService.select(no);
            return new ResponseEntity<>(board, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping()
    public ResponseEntity<?> create(@RequestBody Board board) {
        try {
            int result = boardService.insert(board);
            if (result > 0) {
                return new ResponseEntity<>("SUCCESS", HttpStatus.OK);
            } else {
                return new ResponseEntity<>("FAIL", HttpStatus.OK);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping()
    public ResponseEntity<?> update(@RequestBody Board board) {
        try {
            int result = boardService.update(board);
            if (result > 0) {
                return new ResponseEntity<>("SUCCESS", HttpStatus.OK);
            } else {
                return new ResponseEntity<>("FAIL", HttpStatus.OK);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/{no}")
    public ResponseEntity<?> destroy(@PathVariable Integer no) {
        try {
            int result = boardService.delete(no);
            if (result > 0) {
                return new ResponseEntity<>("SUCCESS", HttpStatus.OK);
            } else {
                return new ResponseEntity<>("FAIL", HttpStatus.OK);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
