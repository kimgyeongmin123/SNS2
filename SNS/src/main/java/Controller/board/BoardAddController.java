package Controller.board;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Controller.SubController;
import Domain.Common.Dto.BoardDto;
import Domain.Common.Service.BoardService;
import Domain.Common.Service.BoardServiceImpl;
@WebServlet("/boardAdd.do")
public class BoardAddController extends HttpServlet implements SubController, Serializable {

	private BoardService service = BoardServiceImpl.getInstance();

	
	  // 직렬화를 위한 serialVersionUID 선언
    private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // JSP 파일 경로 설정
        String jspPath = "/WEB-INF/view/write.jsp";

        // JSP 파일을 포함시킴
        getServletContext().getRequestDispatcher(jspPath).forward(request, response);
    }
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		
		System.out.println("BookAddController execute");

		// GET 요청 처리
		if (req.getMethod().equals("GET")) {
			try {
				System.out.println("get req들어옴");
				req.getRequestDispatcher("/WEB-INF/view/write.jsp").forward(req, resp);
				return;
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		System.out.println("");
		// post 요청 처리
		String content = (String) req.getParameter("content");
		System.out.println("BoardAddController paramtes :" + content);

		try {
			// 2 입력값 검증
			if (content.isEmpty()) {
				System.out.println("[ERROR] Data Validation Check Error!");
				req.setAttribute("msg", "[ERROR] 내용을 입력해주세요.");
				req.getRequestDispatcher("/write.jsp").forward(req, resp);
				return;
			}

			 // BoardDto 객체 생성하여 content를 담음
	        BoardDto dto = new BoardDto();
	        dto.setContent(content);
	        System.out.println(content);

	        // 3 서비스 실행 - BoardService를 활용하여 데이터 삽입
	        //성공하면 1이상 반환, 실패하면 0반환
	        int isInserted = service.boardAdd(dto);

	        if (isInserted>0) {
	            // 게시물 등록 성공 시 메인 페이지로 이동 - Redirect
	            resp.sendRedirect(req.getContextPath() + "/main.jsp");
	        } else {
	            // 게시물 등록 실패 시 오류 메시지와 함께 글 작성 페이지로 이동 - Forward
	            req.setAttribute("msg", "게시물 등록에 실패했습니다.");
	            req.getRequestDispatcher("/add.jsp").forward(req, resp);
	        }

		} catch (Exception e) {
            e.printStackTrace();
		}
	}

}