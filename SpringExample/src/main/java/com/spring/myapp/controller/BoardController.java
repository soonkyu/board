package com.spring.myapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.myapp.domain.Board;
import com.spring.myapp.service.BoardService;
import com.spring.myapp.util.BoardPager;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	//첫 화면 
	@RequestMapping(value="",method=RequestMethod.GET)
	public ModelAndView startMyPro(@RequestParam Map<String,Object> paramMap){
	
		ModelAndView mv=new ModelAndView("index");
		
		return mv;
	}
	
	@RequestMapping(value = "/board/list")
	public ModelAndView boardList(@RequestParam Map<String, Object> paramMap, Model model,@RequestParam(defaultValue="1")int curPage){ 
		//레코드 갯수
		int count=boardService.getBoardCnt();
	    // 페이지 나누기 관련 처리
	    BoardPager boardPager = new BoardPager(count, curPage);
	    int start = boardPager.getPageBegin();
	    int end = boardPager.getPageEnd();
	    
	    List<Board> list = boardService.getContentList(start, end);
	    
	    // 데이터를 맵에 저장
	    Map<String, Object> map = new HashMap<String, Object>();
	    
	    map.put("boardList", list); // list
	    map.put("count", count); // 레코드의 갯수
	    map.put("boardPager", boardPager);
	    map.put("title", paramMap.get("title"));
	    
	    //페이지에 보낼 데이터 저장, 뷰를 list.jsp로 설정
	    ModelAndView mav = new ModelAndView();
	    mav.addObject("map", map); 
	    mav.setViewName("boardList"); 
		
	    return mav;

	}

	//게시글 상세보기
	@RequestMapping(value = "/board/view")
	public String boardView(@RequestParam int idx, Model model) {

		model.addAttribute("boardView", boardService.getContentView(idx));
		model.addAttribute("replyList", boardService.selectComment(idx));

		return "boardView";

	}

	//게시글 등록
	@RequestMapping(value = "/board/edit")
	public String boardEdit(HttpServletRequest request, @RequestParam(defaultValue="0") int idx, Model model) {


		//Referer 검사
		String Referer = request.getHeader("referer");
		
		if(Referer!=null){//URL로 직접 접근 불가

			if(  idx != 0){ //게시글 수정
				
				if(Referer.indexOf("/board/view")>-1){ //정보를 가져온다.

					model.addAttribute("boardView", boardService.getContentView(idx));
					
					return "boardEdit";
				
				} else {
					
					return "redirect:/board/list";
				
				}
			
			} else { //게시글 등록
				
				if(Referer.indexOf("/board/list")>-1){
					
					return "boardEdit";
				
				} else {
					
					return "redirect:/board/list";
				
				}
			}
			
		} else {
			
			return "redirect:/board/list";
		
		}
	}

	@RequestMapping(value="/board/save", method=RequestMethod.POST)
	public String boardSave(@ModelAttribute Board board) {

		if("".equals(board.getIdx())){

			boardService.regContent(board);
			
		} else {
			
			boardService.updateContent(board);
			
		}

		return "redirect:/board/list";

	}

	@RequestMapping(value="/board/del", method=RequestMethod.POST)
	@ResponseBody
	public Object boardDel(@RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> retVal = new HashMap<String, Object>();

		int result = boardService.delBoard(paramMap);

		if(result>0){
			
			retVal.put("code", "OK");
			
		} else {
			
			retVal.put("code", "FAIL");
			
			retVal.put("message", "패스워드를 확인해주세요");
		}

		return retVal;

	}

	@RequestMapping(value="/board/check", method=RequestMethod.POST)
	@ResponseBody
	public Object boardCheck(@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		int result = boardService.getBoardCheck(paramMap);

		if (result>0) {
			
			retVal.put("code", "OK");
			
		} else {
			
			retVal.put("code", "FAIL");
			
			retVal.put("message", "패스워드를 확인해주세요");
		
		}

		return retVal;

	}

	@RequestMapping(value="/board/reply/save", method=RequestMethod.POST)
	@ResponseBody
	public Object boardReplySave(@RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		paramMap.put("commentNum",1+boardService.MaxCommentIdx());
		
		if (paramMap.get("commentParent")==null) {
			
			paramMap.put("commentParent", paramMap.get("commentNum"));
			
		}
		
		int result = boardService.regReply(paramMap);

		if (result>0) {
			
			retVal.put("code", "OK");
			
			retVal.put("commentNum", paramMap.get("commentNum"));
			
			retVal.put("message", "등록에 성공 하였습니다.");
			
		} else {
			
			retVal.put("code", "FAIL");
			
			retVal.put("message", "등록에 실패 하였습니다.");
		}

		return retVal;

	}

	@RequestMapping(value="/board/reply/del", method=RequestMethod.POST)
	@ResponseBody
	public Object boardReplyDel(@RequestParam Map<String, Object> paramMap) {

		Map<String, Object> retVal = new HashMap<String, Object>();

		int result = boardService.delReply(paramMap);

		if (result>0) {
			
			retVal.put("code", "OK");
		
		} else {
			
			retVal.put("code", "FAIL");
			
			retVal.put("message", "삭제에 실패했습니다. 패스워드를 확인해주세요.");
			
		}

		return retVal;

	}

}
