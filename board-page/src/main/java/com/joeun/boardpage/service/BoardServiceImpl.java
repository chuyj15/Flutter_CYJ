package com.joeun.boardpage.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.joeun.boardpage.dto.Board;
import com.joeun.boardpage.dto.Page;
import com.joeun.boardpage.mapper.BoardMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {
    // quick fix : ctrl + .

    @Autowired
    private BoardMapper boardMapper;

    @Override
    public List<Board> list(Page page) throws Exception {
        log.info(page.toString());  
        int total = boardMapper.count();
        page.setTotal(total);
        log.info("이게 셋 토탈 후 : "+page.toString());
        List<Board> boardList = boardMapper.list(page);
        log.info(boardList.toString());
        return boardList;
    }

    @Override
    public Board select(int boardNo) throws Exception {
        Board board = boardMapper.select(boardNo);
        // 조회수 증가...
        return board;
    }

    @Override
    public int insert(Board board) throws Exception {
        int result = boardMapper.insert(board);
        return result;
    }

    @Override
    public int update(Board board) throws Exception {
        int result = boardMapper.update(board);
        return result;
    }
    
    @Override
    public int delete(int boardNo) throws Exception {
        int result = boardMapper.delete(boardNo);
        return result;
    }

    @Override
    public int count() throws Exception {
        return boardMapper.count();
    }
    
}
  