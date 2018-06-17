package com.nuritelecom.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nuritelecom.domain.BoardVO;
import com.nuritelecom.domain.Criteria;
import com.nuritelecom.domain.PageMaker;
import com.nuritelecom.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void indexGet(BoardVO board, Model model) throws Exception {
		logger.info("welcome!!!!");
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGet(BoardVO board, Model model) throws Exception {

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(BoardVO board, RedirectAttributes rttr) throws Exception {
		logger.info(board.toString());
		service.regist(board);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		model.addAttribute("list", service.listAll());
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		model.addAttribute("list", service.read(bno));
	}

	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception {
		service.remove(bno);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modify(@RequestParam("bno") int bno, Model model, @ModelAttribute("cri") Criteria cri) throws Exception {
		model.addAttribute("list", service.read(bno));
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(BoardVO board, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) throws Exception {
		logger.info("@@@   " + cri);
		service.modify(board);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/board/list?page=" + cri.getPage() + "&bno=" + board.getBno() + "&type=" + cri.getType();
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model, @ModelAttribute("cri") Criteria cri) throws Exception {
		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker(cri, service.getTotal());
		model.addAttribute("pageMaker", pageMaker);

	}

}
