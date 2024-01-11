package com.joeun.boardpage.dto;

import lombok.Data;

/*
 * 현재 페이지 번호                      : 1
 * 페이지당 게시글 수                   : 10
 * 노출페이지 개수 (앱에선 필요 없음)   : 10
 * 전체 데이터 개수                    : ?
 * 
 * 시작번호
 * 끝번호
 * 첫번호
 * 마지막번호
 */

@Data
public class Page {
    private static final int PAGE_NUM = 1; //현재 페이지 기본값
    private static final int ROWS = 10; //페이지당 게시글수 기본값
    private static final int COUNT = 10; //노출 페이지 개수 기본값

    //📝 필수 데이터
    private int page; //현재 페이지 번호
    private int rows; //페이지당 게시글 수
    private int count; //노출 페이지 개수
    private int total; //전체 데이터 수
    // 💝 수식 데이터
    private int start; //시작번호
    private int end; //끝번호
    private int first; //첫번호
    private int last; //마지막 번호
    private int prev; //이전 번호
    private int next; //다음 번호

    private int index; //데이터 순서번호

    //생성자
    public Page(){
        // this.page = PAGE_NUM;
        // this.rows = ROWS;
        // this.count = COUNT;
        // this.total = 0;

        this(0);
    }

    public Page(int total){
        this(PAGE_NUM, total);
        this.total = total;

        //이렇게 두개쓰면 에러나는 이유 :  this메소드는 첫 문장에 있어야 함. 
        // this.total = total;
        // this(PAGE_NUM, total);
    }
    public Page(int page, int total){
        this(page, ROWS, COUNT, total);
    }
    public Page(int page, int rows, int count, int total){
        this.page = page;
        this.rows = rows;
        this.count = count;
        this.total = total;
        calc();
    }

    //setTotal만 다시 정의
    public void setTotal(int total){
        this.total = total;
        calc();
    }

    //페이지 처리
    public void calc(){
        //첫번호
        this.first = 1;
        //마지막번호(앱에서는 얘만 실질적으로 쓰임)
        this.last = (this.total - 1) / rows + 1 ;
        //시작번호
        this.start = ((this.page-1) / this.count) * this.count + 1;
        //끝번호
        this.end = ((this.page-1) / this.count + 1) * this.count ;
        if (this.end > this.last) this.end = this.last;
        //이전번호 
        this.prev = this.page <= 1 ? 1 :  this.page - 1;
        //다음번호 
        this.next = this.last > this.page ? this.page +1  : this.last;
        //데이터 시작 순서 번호
        this.index = (this.page -1) * this.rows ;
    }
    

}
