package com.spring.goodluxe.jj;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.goodluxe.voes.AlamVO;
import com.spring.goodluxe.voes.AuctionVO;
import com.spring.goodluxe.voes.Auction_HistoryVO;
import com.spring.goodluxe.voes.ChatMemberVO;
import com.spring.goodluxe.voes.ChatVO;
import com.spring.goodluxe.voes.Chat_recordVO;
import com.spring.goodluxe.voes.Chat_recordcountVO;
import com.spring.goodluxe.voes.Member2VO;
import com.spring.goodluxe.voes.Order2VO;
import com.spring.goodluxe.voes.Purchase2VO;

import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class jaejinuController {

	@Autowired
	private AuctionService auctionService;
	@Autowired
	private HistoryService historyService;
	@Autowired
	private AlamService alamService;
	@Autowired
	private Member2Service memberService;
	@Autowired
	private Order2Service orderService;
	@Autowired
	private Purchase2Service purchaseService;
	@Autowired
	private ChatService chatService;
	@Autowired
	private ChatMemberService chatmemberService;
	@Autowired
	private Chat_recordService chat_recordService;
	@Autowired
	private Chat_recordcountService chat_recordcountService;
	
	// 만든 페이지들 있는 곳으로 이동 
	@RequestMapping("/jaejinupage.do")
	public String jaejinu() {
		
		return "jaejinupage";
	}
	
	
	//관리자 경매 페이지 이동 
	@RequestMapping("/admin_auction.do")
	public String adminAuction() {
		
		return "admin_auction";
	}
	
	
	//로그인 하는 곳으로 이동 
	@RequestMapping(value = "loginForm.do")
	public String loginForm() {
		
		return "loginForm";
	}
	
	
	//회원가입 하는 곳으로 이동 
	@RequestMapping(value="joinForm.do")
	public String joinForm() {
		
		return "joinForm";
	}
	
	
	//챗 관리자
	@RequestMapping(value="chat_admin.do")
	public String chat_admin() {
		
		return "chat_admin";
	}
	
	
	//챗 회원
	@RequestMapping(value="chat_customer.do")
	public String chat_customer() {
		
		return "chat_customer";
	}
	
	
	//채팅 들어가기 전 페이지
	@RequestMapping(value="choicepage.do")
	public String choicepage(Member2VO vo, HttpSession session,HttpServletResponse response) {
		

		String member_id= vo.getMember_id();
		
		int res=0;
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try {
		res = memberService.userCheckMember(member_id);
		
			PrintWriter writer = response.getWriter();
			
			if(res == 1) {
				System.out.println("member_id="+member_id);
				System.out.println(vo.getMember_id());
				session.setAttribute("member_id", vo.getMember_id());
				String member_name = memberService.pickNameMember(member_id);
				session.setAttribute("member_name", member_name);
				System.out.println("member_name"+member_name);
				String member_isadmin = memberService.pickisadminMember(member_id);
				session.setAttribute("member_isadmin", member_isadmin);
				System.out.println("member_isadmin="+member_isadmin);
				if(session.getAttribute("member_isadmin").equals("Y")) {
					
					writer.write("<script>alert('관리자 채팅리스트 입장'); </script>");
					// location.href='./choicepage.do';</script>");
					return "choicepage";
				}
				System.out.println("일로 넘어왔니");
				
				
				ChatMemberVO chatmembervo = new ChatMemberVO();
				chatmembervo.setChat_room(member_id);
				chatmembervo.setMember_id(member_id);
				chatmembervo.setChat_num(0);
				
				
				session.setAttribute("chatmembervo", chatmembervo);
				
				writer.write("<script>alert('유저체크 및 이름 가져오기 성공!!'); </script>");
				return "choicepage";
						//location.href='./choicepage.jsp';</script>");
			} else {
				writer.print("<script>alert('유저체크 실패!!');location.href='./loginForm.do';</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	
	//채팅룸으로 이동
	@RequestMapping(value="chat.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String chat (Model model,HttpSession session) throws Exception{
		String member_id= (String)session.getAttribute("member_id");
		System.out.println(member_id);
		//이전 페이지에서 세션을 받아오는데 속성이름이 login -> 즉 다른 거로 바꿔줘야함 
		/*
		 * MemberVO login = new MemberVO(); login = (MemberVO)
		 * session.getAttribute("member_id");
		 */
		//로그인 상태가 아니라면 로그인 창으로 되돌아가기 
		if(member_id.equals(null)) {
			return "redirect:/loginForm.do";
		}
		int res=0;
		
		ChatMemberVO chatmembervo = new ChatMemberVO();
		
		
		chatmembervo.setChat_num(0);
		chatmembervo.setMember_id(member_id);
		chatmembervo.setChat_room(member_id);
		
		chatmembervo = chatmemberService.getRoomMember(chatmembervo);
		
		
		//DB에 현재 아이디로 어떤 방에 들어가있는지 조사 후, 세팅하기
		if(!member_id.equals("admin")) {
		int count = chatmemberService.countRoomMember(member_id);
		ChatMemberVO chatM = new ChatMemberVO();
		if(count==0) {
			res = chatmemberService.addRoomMember(chatmembervo);
			
			//추가를 한다음 chatM을 다시 받아오도록한다.
			//추가할 때 vo에 set으로 추가해서 넣어주자 저거 안되더라 
			ChatMemberVO chatmembervo_get = new ChatMemberVO();
			chatmembervo_get.setChat_num(0);
			chatmembervo_get.setMember_id(member_id);
			chatmembervo_get.setChat_room(member_id);
				String chat_room = chatmembervo_get.getChat_room();
				System.out.println("-----------");
				System.out.println("chat_room="+chat_room);
			res = chatmemberService.addRoomMember(chatmembervo_get);
			chatM = chatmemberService.getRoomMember(chatmembervo_get);
		}
		//존재한다면 그 방으로 이동 
		else {
			System.out.println("관리자");
			
			if(member_id.equals("admin") && chatmembervo.getChat_room().equals("all")) {
				model.addAttribute("room", "all");
				}else {
				model.addAttribute("room", chatmembervo.getChat_room());
				}
				System.out.println("chatmembervo.getChat_room()="+chatmembervo.getChat_room());
		}
		}
		//현재 방이름 넣기(전체채팅방이니 all)
		//해당 이름으로 넣쟈 
		
		ArrayList<ChatMemberVO> chatlist = (ArrayList<ChatMemberVO>) chatmemberService.selectChatList();
		model.addAttribute("chatlist", chatlist);
		
		ArrayList<Chat_recordVO> chatrecord = new ArrayList<Chat_recordVO>();
		 
		 chatrecord=chat_recordService.selectListchatRecord(member_id);
		 model.addAttribute("chatrecord",chatrecord);
		 ArrayList<Chat_recordVO> chatrecordcountlist = new ArrayList<Chat_recordVO>();
		 chatrecordcountlist = chat_recordService.selectListChatRecordcountdo();
		 model.addAttribute("chatrecordcountlist",chatrecordcountlist);
		
		
		return "chat";
		}
	
	  // 채팅 list count 뽑기 	  
	  @RequestMapping(value="chatroomlistcount.do", method = { RequestMethod.GET, RequestMethod.POST },produces="application/json;charset=UTF-8")
	  @ResponseBody 
	  public ArrayList<ChatMemberVO> chatroomlistcount(HttpServletRequest req, Model model) throws Exception{
	  
	  ArrayList<Chat_recordVO> chatrecord = new ArrayList<Chat_recordVO>();
	  
	  ArrayList<ChatMemberVO> chatmembervo = new ArrayList<ChatMemberVO>();
	  chatmembervo = (ArrayList<ChatMemberVO>) chatmemberService.selectChatList();
	  String chat_room = req.getParameter("chat_room");
	  System.out.println(chat_room); 
	  try {
		  chatrecord = chat_recordService.selectListchatRecord(chat_room);
		  int count =0;
//		 for(int i = 0; i<chatmembervo.size(); i++) {
//			  ArrayList<Chat_recordVO> chatcount = chat_recordService.selectListchatRecordCount(chatmembervo.get(i).getChat_room());
//			  
//			  for(int j=0; j<chatcount.size(); j++) {
//				  if(chatmembervo.get(i).getChat_room()==chatcount.get(i).getChat_room()) {
//					  count++;
//				  }else {
//					  break;
//				  }
//			  }
//		  }
		  
		  model.addAttribute("chatrecord",chatrecord); 
			  
		  
	  }catch(Exception e){
	  System.out.println("chat_room 실패 +"+e.getMessage()); }
	 
	  return chatmembervo; }
	 
	
	
	
		
		//중복확인
		@RequestMapping(value="checkRoom.do", method = { RequestMethod.GET, RequestMethod.POST })
		@ResponseBody
		public int checkRoom(Model model, String name) throws Exception{
			System.out.println("name="+name);
			
			ChatVO dto = chatService.checkRoom(name);
			//중복값이 없을경우
			if(dto ==null) {
				return 1;
			}
			else {
				return 0;
			}		
		}
		
		//방이동
		@RequestMapping(value="MoveChatRoom.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String MoveChatRoom (Model model, HttpServletRequest req) throws Exception{
			
			String login = (String) req.getSession().getAttribute("member_id");
			System.out.println(login );
			
			String roomName = req.getParameter("roomName");
			System.out.println(roomName);
			if(login==null) {
				return "redirect:/loginForm.do";
			}
			
			System.out.println("이동할 방이름 : "+roomName);
			
			
		ChatMemberVO chatmembervo = new ChatMemberVO();
		chatmembervo.setChat_num(0);
		chatmembervo.setMember_id(login);
			chatmembervo.setChat_room(roomName);
			//이동하게 될 방 이름으로 수정
			chatmemberService.updateRoomMember(chatmembervo);
			
			//접속 끊기 이전방은 수정하지 않음.
			
			//방이동 처리
			ArrayList<ChatMemberVO> chatlist = (ArrayList<ChatMemberVO>) chatmemberService.selectChatList();
			model.addAttribute("chatlist", chatlist);
			
			model.addAttribute("room", roomName);
			ArrayList<Chat_recordVO> chatrecordcountlist = new ArrayList<Chat_recordVO>();
			 chatrecordcountlist = chat_recordService.selectListChatRecordcountdo();
			 model.addAttribute("chatrecordcountlist",chatrecordcountlist);
			
			return "chat";
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//채팅하는 곳으로 이동 
	@RequestMapping(value="client_chat.do", method=RequestMethod.GET)
	public String home() {
		
		return "client_chat";
	}
	
	
	//관리자 >> 채팅 리스트 가 있는 페이지 이동 
	@RequestMapping(value="admin_chat_room.do", method=RequestMethod.GET)
	public String admin_chat_room(Member2VO vo, HttpSession session,Model model) {
		
		ArrayList<ChatVO> chatlist = null;
		try{
			chatlist = chatService.SelectChatList();
		}catch(Exception e) {
			System.out.println("컨트롤러 챗리스트가져오기실패+"+e.getMessage());
		}
		model.addAttribute("chatlist", chatlist);
		
		return "admin_chat_room";
	}
	
	// 멤버 가입  >> 다시 로그인 페이지로 
	@RequestMapping(value="memberinsert.do")
	public String memberinsert(Member2VO vo) {
		
		try {
		memberService.insertMember(vo);
		}catch(Exception e) {
		System.out.println("멤버 추가 최종실패+"+e.getMessage());	
		}
		return "loginForm";
	}
	
	
	// 멤버가 있나 확인 후 관리자 확인 후 각 페이지로 이동 
	@RequestMapping(value="memberCheck.do")
	public String usesrCheckMember(Member2VO vo, HttpSession session, HttpServletResponse response) {
		
		String member_id= vo.getMember_id();
		
		int res=0;
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try {
		res = memberService.userCheckMember(member_id);
		
			PrintWriter writer = response.getWriter();
			
			if(res == 1) {
				session.setAttribute("member_id", vo.getMember_id());
				String member_name = memberService.pickNameMember(member_id);
				session.setAttribute("member_name", member_name);
				String member_isadmin = memberService.pickisadminMember(member_id);
				session.setAttribute("member_isadmin", member_isadmin);
				System.out.println(member_isadmin);
				if(session.getAttribute("member_isadmin").equals("Y")) {
					writer.write("<script>alert('관리자 채팅리스트 입장'); location.href='./admin_chat_room.do';</script>");
				}
				
				ChatMemberVO chatmembervo = new ChatMemberVO();
				
				chatmembervo.setChat_room(member_id);
				chatmembervo.setMember_id(member_id);
				chatmemberService.addRoomMember(chatmembervo);
				session.setAttribute("", chatmembervo);
				
				writer.write("<script>alert('유저체크 및 이름 가져오기 성공!!'); location.href='./client_chat.do?member_id="+member_id+"';</script>");
			} else {
				writer.print("<script>alert('유저체크 실패!!');location.href='./loginForm.do';</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	

	// 경매 상세페이지 만들 때
	@RequestMapping(value = "/rudaodetail.do")
	public String rudaodetail(@RequestParam("file_1")List<MultipartFile> fileList_1,@RequestParam("file_2")List<MultipartFile> fileList_2 ,MultipartHttpServletRequest request, AuctionVO auctionvo, Request2Model model,
			Model model_t) throws IllegalStateException, IOException {
		
		String uploadPath = "C:\\Project138\\upload\\";
	      File fileDir = new File(uploadPath); 
	      if (!fileDir.exists()) { 
	         fileDir.mkdirs(); 
	      } 
	      

		
			int cnt = 0;
		for(MultipartFile mf_1 : fileList_1) {
		
		String originalFileExtension_1 = mf_1.getOriginalFilename()
				.substring(mf_1.getOriginalFilename().lastIndexOf("."));
		String storedFileName_1 = UUID.randomUUID().toString().replace("-", "") + originalFileExtension_1;

		
		try {
			mf_1.transferTo(new File(uploadPath + storedFileName_1));
			switch (cnt) {
			
			case 0: auctionvo.setAUCTION_PHOTO1_STORED(storedFileName_1);
				break;
			case 1: auctionvo.setAUCTION_PHOTO2_STORED(storedFileName_1);
				break;
			case 2: auctionvo.setAUCTION_PHOTO3_STORED(storedFileName_1);
				break;
			case 3: auctionvo.setAUCTION_PHOTO4_STORED(storedFileName_1);
				break;
			default:
				break;
			
		}
			cnt++;
		
		}catch(Exception e) {
			System.out.println("추가실패..?"+e.getMessage());
		}
		
		}
		
		 String str = "";
		long time = System.currentTimeMillis(); 

       
            try { // 파일생성
         	 for (MultipartFile mf : fileList_2) { 
                 String originFileName = mf.getOriginalFilename(); // 원본 파일 명 
                 String saveFileName = String.format("%d_%s", time, originFileName);
               mf.transferTo(new File(uploadPath, saveFileName)); 
               str += saveFileName + ",";
            
            }} catch (Exception e) { 
               e.printStackTrace(); 
               }
            if(str.length() != 0) {
                str = str.substring(0, str.length()-1);
             } else {
                str = "#";
             }
            auctionvo.setAUCTION_PHOTO5_STORED(str);
         
		int count = 0;
		String entitynum = auctionvo.getENTITY_NUMBER();
			System.out.println(entitynum);
		try {
			Purchase2VO purchasevo = purchaseService.selectPurchase(entitynum);
			auctionService.insertAuction(auctionvo);
			int AUCTION_POST_NUMBER = auctionvo.getAUCTION_POST_NUMBER();
			AuctionVO vo = auctionService.selectAuction(auctionvo);
			model_t.addAttribute("purchasevo", purchasevo);
			model_t.addAttribute("auctionvo", vo);
			count = historyService.selecthistorycount(AUCTION_POST_NUMBER);
			
			model_t.addAttribute("auctionnumber", count);
		} catch (Exception e) {
			e.getMessage();
		}
		return "rudaodetail";
	}

	// 입찰하기
	@RequestMapping(value="/history.do", method=RequestMethod.GET,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String historyinsert(Model model_t,
			HttpServletRequest request) {
		int auction_post_number = Integer.parseInt(request.getParameter("auction_post_number"));
		System.out.println(auction_post_number);
		String member_id = request.getParameter("member_id");
		System.out.println(member_id);
		System.out.println(request.getParameter("AUHIS_BETTING_PRICE"));
		int auhis_betting_price = Integer.parseInt(request.getParameter("AUHIS_BETTING_PRICE"));
		System.out.println(auhis_betting_price);
		
		Auction_HistoryVO historyvo = new Auction_HistoryVO();
		System.out.println(auction_post_number);
		historyvo.setAUCTION_POST_NUMBER(auction_post_number);
		historyvo.setMEMBER_ID(member_id);
		historyvo.setAUCTION_POST_NUMBER(auhis_betting_price);
		
		int count = 0;
		int AUCTION_POST_NUMBER = historyvo.getAUCTION_POST_NUMBER();
		System.out.println("AUCTION_POST_NUMBER="+auction_post_number);
		try {
			System.out.println("history");
			historyService.insertHistory(historyvo);
			System.out.println("history");
			AuctionVO vo_2 = auctionService.selectAuction_PostNumber(auction_post_number);
			System.out.println(vo_2.getENTITY_NUMBER());
			System.out.println(vo_2.getAUCTION_DETAIL());
			System.out.println(vo_2.getAUCTION_MD_NAME());
			System.out.println("history");
			String entitynumber = vo_2.getENTITY_NUMBER();
			
			Purchase2VO purchasevo = purchaseService.selectPurchase(entitynumber);
			System.out.println("history");
			model_t.addAttribute("purchasevo", purchasevo);
			
			
			model_t.addAttribute("auctionvo", vo_2);
			count = historyService.selecthistorycount(auction_post_number);
			model_t.addAttribute("auctionnumber", count);
			
		} catch (Exception e) {
			System.out.println("입찰 실패 +" + e.getMessage());
		}
		return "rudaodetail";

	}

	// 회원 -> 경매방 입장
	@RequestMapping(value = "/auctiondetail.do")
	public String historyselect(AuctionVO auctionvo, Auction_HistoryVO historyvo, Model model_t,
			HttpServletRequest request) {
		int count = 0;
		int AUCTION_POST_NUMBER = historyvo.getAUCTION_POST_NUMBER();
		try {
			historyService.insertHistory(historyvo);
			Auction_HistoryVO vo_2 = historyService.selectHistory(AUCTION_POST_NUMBER);
//		AuctionVO vo = auctionService.selectAuction_PostNumber(AUCTION_POST_NUMBER);

//		model_t.addAttribute("auctionvo", vo);
			model_t.addAttribute("historyvo", vo_2);

		} catch (Exception e) {
			System.out.println("입찰실패+" + e.getMessage());
		}
		return "rudaodetail";

	}

	// 경매 순위 보기
	@RequestMapping(value = "/auctionhistory.do")
	public String auctionhistory(Model model_t, HttpServletRequest request) {
		int auction_post_number = 0;
		auction_post_number = Integer.parseInt(request.getParameter("auction_post_number"));
		ArrayList<Auction_HistoryVO> list = null;
		try {
			list = historyService.auctionhistoryselect(auction_post_number);
			model_t.addAttribute("list", list);
		} catch (Exception e) {
			System.out.println("히스토리 조회 실패+" + e.getMessage());
		}

		return "history";

	}

	// 회원에서 경매 들어갈 때
	@RequestMapping(value = "/member_auction_history.do" )
	public String member_auction_history(HttpServletRequest request, Model model_t) {
		int auction_post_number = 0;
		auction_post_number = Integer.parseInt(request.getParameter("AUCTION_POST_NUMBER"));
		System.out.println(auction_post_number);
		Purchase2VO purchasevo = new Purchase2VO();
		
		int count = 0;
		try {
			AuctionVO vo_1 = auctionService.selectAuction_PostNumber(auction_post_number);
			System.out.println("1");
			String entity_number = vo_1.getENTITY_NUMBER();
			System.out.println(entity_number);
			purchasevo = purchaseService.selectPurchase(entity_number);
			System.out.println("1");
			model_t.addAttribute("auctionvo", vo_1);
			System.out.println("1");
			count = historyService.selecthistorycount(auction_post_number);
			model_t.addAttribute("auctionnumber", count);
			model_t.addAttribute("purchasevo", purchasevo);
		} catch (Exception e) {
			System.out.println("멤버로 경매 들어가기 실패+" + e.getMessage());
		}

		return "rudaodetail";
	}
	
	
	
	@RequestMapping(value="/insertJSON.do", method=RequestMethod.GET,produces="application/json;charset=UTF-8")
	@ResponseBody // 이 이노테이션은 jsp와 같은 뷰를 전달 하는게 아닌 데이터를 전달하기 위해 사용
	public int insertJSON(HttpServletRequest request) {
		AuctionVO auctionvo = new AuctionVO();
		Auction_HistoryVO historyvo = new Auction_HistoryVO();
		Order2VO ordervo = new Order2VO();
		AlamVO alamvo = new AlamVO();
		Member2VO membervo = new Member2VO();
		int res = 0;
		int auction_post_number = Integer.parseInt(request.getParameter("auction_post_number"));
		String link = request.getParameter("link");
		try {
			auctionvo = auctionService.selectAuction_PostNumber(auction_post_number);
			historyvo = historyService.auctionhistoryselectone(auction_post_number);
			String x = "X";
			alamvo.setMember_id(historyvo.getMEMBER_ID());
			String member_id = historyvo.getMEMBER_ID();
			alamvo.setAlam_read(x);
			alamvo.setAlam_linkpage(link);
			alamvo.setAlam_number(0);
			res= alamService.insertAlam(alamvo);
			System.out.println(member_id);
			membervo = memberService.selectMember1(member_id);

			//난수 생성
			double dValue = Math.random();
		    int iValue = (int)(dValue * 100000);
		    
		    
			Timestamp order_order_date = (Timestamp)auctionvo.getAUCTION_END_TIME();
			String opd = order_order_date+"";
			String order_receipt = membervo.getMember_name();
			
			String order_addr1 = membervo.getMember_addr1();
			String order_addr2 = membervo.getMember_addr2();
			String order_phone = membervo.getMember_phone();
			String order_zipcode = membervo.getMember_zipcode();
				String[] array = opd.split(" ");
				String[] array_2 = array[0].split("-");
				
			    String makenumbering="";
				//출력				
				for(int j=0;j<array_2.length;j++) {
					makenumbering += array_2[j];
				}
				System.out.println(makenumbering);
			int paydate=Integer.parseInt(makenumbering);
			String order_number = paydate+iValue+"";
			String order_invoice_number = paydate+iValue+"";
			int order_product_price = historyvo.getAUHIS_BETTING_PRICE();
			Timestamp order_ship_date = null;
			Timestamp order_pay_date = null;
			Timestamp order_cancel_date = null;
			int order_ship_fee = 0;
			if(order_product_price < 1000000) {
				order_ship_fee = 5000;
			}
			
			int order_used_point = 0;
			String order_used_coupon = " ";
			String order_pay_system = " ";
			String order_refund_bank = " ";
			String order_refund_account = " ";
			int post_number = auctionvo.getAUCTION_POST_NUMBER();
			int pb_number = post_number;
			String order_message = " ";
			int order_pay_price = order_product_price-order_ship_fee-order_used_point;
			ordervo.setOrder_number(order_number);
			
			String order_status = "입금전";
			
			
			 
			
			  ordervo.setOrder_number(order_number);//VARCHAR2
			  ordervo.setOrder_receipt(order_receipt);//VARCHAR2
			  ordervo.setOrder_status(order_status);//VARCHAR2
			  ordervo.setOrder_addr1(order_addr1);//VARCHAR2
			  ordervo.setOrder_addr2(order_addr2);//VARCHAR2
			  ordervo.setOrder_phone(order_phone);//VARCHAR2
			  ordervo.setOrder_zipcode(order_zipcode);//VARCHAR2
			  ordervo.setOrder_invoice_number(order_invoice_number);//number
			  ordervo.setOrder_product_price(order_product_price); //number
			  ordervo.setOrder_ship_fee(order_ship_fee);//number
			  ordervo.setOrder_used_point(order_used_point);//number
			  ordervo.setOrder_used_coupon(order_used_coupon);//VARCHAR2
			  ordervo.setOrder_pay_system(order_pay_system);//VARCHAR2
			  ordervo.setOrder_refund_bank(order_refund_bank); //VARCHAR2
			  ordervo.setOrder_refund_account(order_refund_account); //VARCHAR2
			  ordervo.setPb_number(pb_number); //number 
			  ordervo.setMember_id(member_id); //VARCHAR2 
			  ordervo.setOrder_message(order_message); //VARCHAR2
			  ordervo.setOrder_pay_price(order_pay_price); //number
			 			 			
			orderService.insertorder(ordervo);
			
			
			
		}catch(Exception e) {
			System.out.println("뭔가 안댔네+"+e.getMessage());
			
		}
		
		
		
		return res;
	}
	
	
	@RequestMapping(value = "/enumberCheck.do" ,method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody 
	public int entityCheck(String entity_number) throws Exception {
               
		return purchaseService.entitycheck(entity_number);
    }

	
	
	
	
	
	@RequestMapping(value = "/putimporamtion.do" ,method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody 
	public Purchase2VO selectinpormation(String entity_number) throws Exception {
		
		 Purchase2VO purchasevo = purchaseService.selectPurchase(entity_number);
		System.out.println(purchasevo.getEntity_number());
		return purchasevo;
    }
	
	
	
	
	
	
	/*
	 * @RequestMapping(value="/insertJSON.do",
	 * method=RequestMethod.GET,produces="application/json;charset=UTF-8")
	 * 
	 * @ResponseBody // 이 이노테이션은 jsp와 같은 뷰를 전달 하는게 아닌 데이터를 전달하기 위해 사용 public int
	 * insertJSON(HttpServletRequest request) {
	 */
	
	
	
	@RequestMapping(value="/keywordSearch.do", method=RequestMethod.GET, produces="application/text; charset=utf-8")
	public @ResponseBody String keywordSearch(@RequestParam("entity_number") String entity_number,HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		if(entity_number == null || entity_number.equals(""))
			return null;
		
		entity_number = entity_number.toUpperCase();
		List keywordList = purchaseService.selectEntitySearchWord(entity_number);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
		String jsonInfo = jsonObject.toString();
		
		return jsonInfo;
		/*Map<String, Object> retVal = new HashMap<String, Object>();
        
		
        retVal.put("keywordList", keywordList); //bookList란 키로 bookList의 값을 넣어줍니다. (웹에서 bookList키로 추출
        
        retVal.put("code", "OK");
        
        return retVal;*/
		
		
	}
	
	@RequestMapping(value="/searchpurchase.do",method=RequestMethod.GET)
	public ModelAndView searchPurchase(@RequestParam("searchWord") String searchWord,HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		String viewName=(String)request.getAttribute("viewName");
		List purchaseList = purchaseService.selectKeywordSearch(searchWord);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("purchaselist",purchaseList);
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 
}
