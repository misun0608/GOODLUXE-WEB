<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<a href="#index_top_menu">
    <div class="top_button">
        <img src="${pageContext.request.contextPath}/resources/img/icons/top.png">
    </div>
</a>
<a name="top"></a>
<div class="index_area" id="index_top_menu">
    <a href="#pay_index">
        <div class="index_button">
            <div class="how_to_index">
                <img src="${pageContext.request.contextPath}/resources/img/how_to_icon/pay.png">
                <p>주문&결제</p>
            </div>
            <div class="how_to_index_dark"></div>
        </div>
    </a>
    <a href="#consign_index">
        <div class="index_button">
            <div class="how_to_index">
                <img src="${pageContext.request.contextPath}/resources/img/how_to_icon/consign.png">
                <p>위탁 판매</p>
            </div>
            <div class="how_to_index_dark"></div>
        </div>
    </a>
    <a href="#sell_index">
        <div class="index_button">
            <div class="how_to_index">
                <img src="${pageContext.request.contextPath}/resources/img/how_to_icon/sell.png">
                <p>&nbsp;&nbsp;&nbsp;매&nbsp;&nbsp;&nbsp;입&nbsp;</p>
            </div>
            <div class="how_to_index_dark"></div>
        </div>
    </a>
    <a href="#point_index">
        <div class="index_button">
            <div class="how_to_index">
                <img src="${pageContext.request.contextPath}/resources/img/how_to_icon/point.png">
                <p>&nbsp;포&nbsp;인&nbsp;트</p>
            </div>
            <div class="how_to_index_dark"></div>
        </div>
    </a>
</div>
<div class="index_area">
    <a href="#deliever_index">
        <div class="index_button">
            <div class="how_to_index">
                <img src="${pageContext.request.contextPath}/resources/img/how_to_icon/deliever.png">
                <p>&nbsp;&nbsp;&nbsp;배&nbsp;&nbsp;&nbsp;송&nbsp;</p>
            </div>
            <div class="how_to_index_dark"></div>
        </div>
    </a>
    <a href="#cancel_index">
        <div class="index_button">
            <div class="how_to_index">
                <img src="${pageContext.request.contextPath}/resources/img/how_to_icon/cancel.png">
                <p>취소&반품</p>
            </div>
            <div class="how_to_index_dark"></div>
        </div>
    </a>
    <a href="#grade_index">
        <div class="index_button">
            <div class="how_to_index">
                <img src="${pageContext.request.contextPath}/resources/img/how_to_icon/grade.png">
                <p>상품 등급</p>
            </div>
            <div class="how_to_index_dark"></div>
        </div>
    </a>
    <a href="#help_index">
        <div class="index_button">
            <div class="how_to_index">
                <img src="${pageContext.request.contextPath}/resources/img/how_to_icon/help.png">
                <p>판매 방법</p>
            </div>
            <div class="how_to_index_dark"></div>
        </div>
    </a>
</div>

<section class="how_to_content">
    <div class="how_to_order">
        <h3 class="how_to_title" id="pay_index">주문</h3>
        <br />
        <p class="order_sub_title">1. 주문하고자 하는 상품을 클릭</p>
        <p class="order_sub_explain">
            '확대보기'를 클릭하시면 상품의 상세한 사진이 나타납니다.</br>
            컴퓨터 환경에 따라 사진과 실제 상품의 컬러가 상이할 수 있으므로 상품 우측에 기재된 색상을 확인바랍니다.
        </p>
        <br />
        <p class="order_sub_title">2.'구매하기'버튼 클릭</p>
        <p class="order_sub_explain">
            한번에 한개의 상품만 결제가 가능합니다(보유매장에 따라 배송비가 추가로 부담될 수 있음)<br />
            '좋아한 상품'에 넣었다고 자동 주문되는 것은 아니오니, 반드시 구매 상품을 선택 후 '주문'버튼을 클릭하세요.<br />
            바로 구매란 한 상품씩 구매 가능하며 택배비가 각각 부과됩니다. <br />
            택배비는 각각 결제하시더라도 묶음배송되는 경우 상품과 과배송금액에 대하여 배송 시 박스에 동봉하여 드립니다.<br />
            로그인 후 정회원으로 구매를 하시면 구매 Point 적립 및 우수구매자 제도 등의 혜택이 있습니다.<br />
        </p>
        <br />
        <p class="order_sub_title">3. 주문/결제가 나오면 정호가한 배송지 정보 입력</p>
        <p class="order_sub_explain">
            로그인 후 회원으로 주문하기를 하시면 하단의 결제방법만 선택하시면 됩니다.<br />
            비회원으로 주문시 이름, 주소, 전화번호를 정확히 작성하셔야 배송사고를 방지할 수 있습니다.
        </p>
        <br />

        <h3 class="how_to_title">결제</h3>
        <br />
        <p class="order_sub_title"> 1. 결제방법은 신용카드 결제와 무통장입금 모두 가능합니다.</p>
        <p class="order_sub_explain">
            무통장 주문시 익일 오후7시(주말및공휴일제외)이내 입금되지 않으면 자동 주문취소 및 허수구매에 따른 구매제한을 받게 됩니다 .<br />
            단, 자동주문 취소 전 전화 또는 상품게시판에 구매취소를 밝히면 구매제한의 벌점은 부과되지 않습니다.<br />
            또한 업데이트 미리보기 상품들은 주문후 구매취소를 요청하셔도 구매제한제도에 의해 허수구매로 처리합니다.<br />
            무통장 주문시 가상계좌가 발급되며 1회성 계좌로 재사용이 안됩니다. 주문금액 송금시 인터넷 뱅킹이나 CD기를 통한 이체만 가능합니다.<br />
        </p>
        <br />
        <p class="order_sub_title">
            2. 주문한 상품내용은 홈페이지 상단의 '마이페이지' 주문/배송조회에서 확인 가능합니다.
        </p>
        <br />
        <p class="order_sub_title">
            3. 경비실 보관, 배송전 택배기사전화연락 등 추가정보 사항이 있으면 배송정보 기재시 '배송시 요청사항'에 작성하여 주십니오.
        </p>
        <br /><br />
    </div>
    <div class="how_to_consign">
        <h3 class="how_to_title" id="consign_index">위탁판매</h3>
        <p class="order_sub_title">위탁절차</p>
        <div class="consign_step_container">
            <div class="consign_step">
                <p class="step_title">STEP 1</p>
                <p class="step_letter1">위탁신청</p>
            </div>
            <img src="${pageContext.request.contextPath}/resources/img/how_to_icon/next.png" class="next_img">
            <div class="consign_step">
                <p class="step_title">STEP 2</p>
                <p class="step_letter2">수령후 <br />인터넷 등록</p>
            </div>
            <img src="${pageContext.request.contextPath}/resources/img/how_to_icon/next.png" class="next_img">
            <div class="consign_step">
                <p class="step_title">STEP 3</p>
                <p class="step_letter2">온/오프라인 <br /> 동시판매</p>
            </div>
            <img src="${pageContext.request.contextPath}/resources/img/how_to_icon/next.png" class="next_img">
            <div class="consign_step">
                <p class="step_title">STEP 4</p>
                <p class="step_letter1">위탁자에게 송금</p>
            </div>
        </div>

        <br /> <br />
        <ul>
            <li> 위탁신청(판매의뢰) : 전화 및 게시판 또는 메신저 이용.(<a href="#">매장안내 바로가기</a>)</li>
            <li> 수령후 인터넷 등록 : 전화 및 게시판 또는 메신저 이용.</li>
        </ul>
        <div class="product_register_step">
            <ul>
                <li>접수 : 가까운 goodluxe 매장 방문 또는 택배로 상품 접수(회원가입 필요)</li>
                <li>감정 : GIA보석감정사, 35년 경력의 시계장인, 잡화감정팀에서 진품 여부 및 시세 확인</li>
                <li>촬영 : 당사 내 스튜디오에서 상품별 디테일 컷 촬영</li>
                <li>등록 : 상태, 색상, 사이즈, 소재 등 상품별 특성을 작성록(전화, 게시판, 또는 메신저 사용)</li>
            </ul>
        </div>
        <br />
        <ul>
            <li>온/오프라인 동시 판매</li>
        </ul>
        <div class="onoff_line_selling">
            <p>
                우리 사이트의 직영 매장으로 이동하여 진열하고 온라인 쇼핑몰에서도 동시 판매.<br />
                판매 진행상황 및 배송현황은 마이포켓이서 위탁자가 확인가능
            </p>
        </div>
        <br />
        <ul>
            <li>위탁자에게 송금</li>
        </ul>
        <div class="to_customer_send">
            <p>위탁고객이 등록한 계좌로 송금<br />
                마이포켓내 위탁상품관리에서 송금내역 확인가능</p>
        </div>
        <br /><br />
        <p class="order_sub_title">위탁수수료</p>
        <p class="order_commission_notice">위탁수수료는 판매금액 구간별 차등하여 적용하고 있으며 고가의 상품일수록 낮은 수수료율이
            적용됩니다.</p>

        <table class="commision_notice_table">
            <tr>
                <th colspan="2">구분</th>
                <th class="price_range">~20만원 구간</th>
                <th class="price_range">20~300만원<br />구간</th>
                <th class="price_range">300만원<br />초과 구간</th>
                <th>예시</th>
            </tr>
            <tr>
                <th colspan="2">가방/지갑<br />/기타 악세서리</th>
                <td rowspan="3">4만8천원</td>
                <td>18%</td>
                <td>13%</td>
                <td>400만원 판매 시<br /> 4만8천원 + (300만-20만) * 18% <br />+ (400만-300만) * 13%</td>
            </tr>
            <tr>
                <th rowspan="2">시계/보석<br />에르메스 벌킨, 켈리</th>
                <td class="small">300만원 미만</td>
                <td>18%</td>
                <td>해당없음</td>
                <td>200만원 판매 시<br /> 4만8천원 + (300만-20만) * 18% </td>
            </tr>
            <tr>
                <td class="small">300만원 이상</td>
                <td colspan="2">13%</td>
                <td>400만원 판매 시<br /> 4만8천원 + (300만-20만) * 13% </td>
            </tr>
        </table>
        <table class="commision_notice_table">
            <tr>
                <th>구분</th>
                <th class="price_range">~15만원 구간</th>
                <th class="price_range">15~100만원<br />구간</th>
                <th class="price_range">100만원<br />초과 구간</th>
                <th>예시</th>
            </tr>
            <tr>
                <th>의류/신발/안경(선글라스)</th>
                <td>4만8천원</td>
                <td>28%</td>
                <td>18%</td>
                <td>200만원 판매 시<br /> 4만8천원 + (100만-15만) * 28% <br />+ (200만-100만) * 18%</td>
            </tr>
        </table>
        <br />
        <div>
            <table class="caution_table">
                <tr>
                    <td class="img_area">
                        <img src="${pageContext.request.contextPath}/resources/img/how_to_icon/caution.png" class="caution_img">
                    </td>
                    <th> 주의사항</th>
                </tr>
            </table>
            <ul class="caution_list">
                <li>위탁수수료율의 변경은 위탁일자를 기준으로 합니다.</li>
                <li>위탁수수료는 현금 판매와 카드 판매가 동일합니다.</li>
                <li>
                    위탁기간은 상품접수 후 취소 3개월이며 1개월 내에 회수시에는 4만8천원,
                    3개월 내에 회수시에는 2만원의 위약금이 부과됩니다.
                </li>
                <li>
                    고의적인 가품 위탁시(ex 동일 브랜드 가품건 2건이상 위탁 등) 에는 상품 등록과 관계없이
                    이유 불문하고 즉시 형사 고발 조취하므로서 건전한 명품시장의 활성화를 도모하고자 합니다.
                </li>
            </ul>
            <br /><br /><br />
        </div>
    </div>
    <div class="how_to_acquisition">
        <h3 class="how_to_title" id="sell_index">매입안내</h3>
        <ul class="acquisition_list">
            <li>시계, 가방, 지갑 및 쥬얼리 등 다양한 아이템과 브랜드에 대해 현금매입이 가능합니다.</li>
            <li>브랜드선호도, 상태, 사이즈, 부속품 등 다양한 기준과 명품판매 노하우로 고객을 위한 합리적인 가격을 제시합니다.</li>
            <li>국내 최대 위탁전문 구구스에서는 매입이 안되더라도 위탁판매로 전환하여 빠른 회전을 보장합니다.</li>
            <li>명품매장 폐점 및 재고처리 등으로 인한 대량 매입은 수량과 금액 관계없이 연락주시면 상담해 드립니다.</li>
        </ul>
        <div class="acqusition_higher_price">
            <p>매입시 높은 가격 받는 법</p>
            <ul>
                <li>1. 부속품(보증서, 박스, 더스트백 등)을 함께 보관하세요.</li>
                <li>2. 구매 영수증은 아주 중요한 포인트로 가격에서 차이가 납니다.</li>
                <li>3. 깨끗한 상태로 보관해주세요</li>
            </ul>
        </div>

        <h3 class="how_to_title">매입절차</h3>
        <table class="selling_procedure">
            <tr>
                <th>STEP 1. 판매문의</th>
                <td>
                    전화 및 게시판 또는 메신저를 이용하여 문의 해주세요.<br />
                    제품 실물을 보기 전에는 가격 책정이 어려우니, 택배 또는 내방해주시기 바랍니다.(유선상으로는 매입 가능 여부만 상담 가능)
                    <a href="#">근처 매장 안내 바로가기</a>
                </td>
            </tr>
            <tr>
                <th>STEP 2. 방문 또는 배송으로 제품 전달</th>
                <td>
                    방문고객 : 가까운 구구스 매장 방문 (필히,신분증 지참)<br />
                    배송고객 : 대치본점 배송 (서울시 강남구 대치동 923-16 디앤비빌딩 3F, 신분증 사본 동봉 /
                    Fax:02-554-8912)
                </td>
            </tr>
            <tr>
                <th>STEP 3. 감정 후 매입 가격 결정</th>
                <td>
                    택배 접수시 감정 후 담당자가 고객님께 직접 전화를 드립니다.<br />
                    매입가격 결정기준 : 진품여부, 현재 시세, 유행여부, 계절, 인기품목 여부, 부속품 유무 등을 종합적으로 고려하여 결정하게
                    됩니다.<br />
                    매입가격이 맞지 않을 경우 위탁판매로 전환이 가능합니다.<br />

                </td>
            </tr>
            <tr>
                <th>STEP 4. 매입 결정 후 현금 지급 또는 인터넷 송금</th>
                <td>
                    방문고객 : 매장 현금지급<br />
                    배송고객 : 인터넷 뱅킹 송금
                </td>
            </tr>
        </table>

        <h3 class="how_to_title">매입 가능 품목</h3>
        <table class="selling_brand_list">
            <tr>
                <th>Bag</th>
                <td>
                    샤넬, 루이비통, 에르메스, 구찌, 펜디, 프라다, 지방시, 발렌시아가, 끌로에, 고야드, 보테가베네타,
                    델보, 콜롬보, 랑방, 프라다, 발렉스트라, 생로랑파리 등
                </td>
            </tr>
            <tr>
                <th>WATCH</th>
                <td>
                    로렉스, IWC, 까르띠에, 로져드뷔, 루이비통, 리차드밀, 몽블랑, 아랑게운트죄네, 바쉐론콘스탄틴,
                    반클리프앤아펠, 불가리, 브라이틀링, 브레게, 블랑팡, 샤넬, 쇼메, 쇼파드, 에르메스,
                    예거르꿀르트, 오데마피게, 오메가, 위블로, 제니스, 지라드페르고, 크로노스위스, 테그호이어, 티파니,
                    파텍필립, 프랭크뮬러, 피아제, 헤리윈스턴 등 고가명품시계 全상품
                </td>
            </tr>
            <tr>
                <th>Clothes</th>
                <td>
                    겨울 지난 이후 시즌 아웃된 의류 및 신발<br />
                    패딩, 코트 부츠 등 다양한 겨울 상품(단, 모피류 제외)
                    키즈 상품(수도권매장은 아우터만 가능)
                </td>
            </tr>
            <tr>
                <th>Accessary</td>
                <td>
                    부쉐론, 불가리, 까르띠에, 샤넬, 쇼메, 쇼파드, 다미아니, 드비어스, 프랭크뮬러, 프레드, 구찌, 헤리윈스턴,
                    에르메스, 루이비통, 몽블랑, 피아제, 다사끼, 티파니, 반클리프앤아펠 등 브랜드쥬얼리 및 목걸이, 귀걸이, 반지,
                    헤어 악세서리, 각종 악세서리 및 다이아몬드 등
                </td>
            </tr>
        </table>
        <br />
    </div>
    <div class="how_to_point">
        <h3 class="how_to_title" id="point_index">포인트</h3>
        <p class="point_notice">
            포인트는 구매완료된 상품가격의 0.1%가 적립됩니다. (ex : 100만원 상품 구매 시 1,000 Point 적립)<br />
            최대 적립가능한 상품가격은 5천만원이며 그 이상 구매하셔도 5천만원에 대한 0.1%만 적립됩니다<br />
            포인트적립은 구매자의 결제시점이 아닌 위탁자에게 송금완료시점에 적용됩니다.<br />
            10,000 Point 이상 적립되면 1,000Point 단위로 현금처럼 상품 구매 하시는데 사용하실 수 있습니다. (1Point =
            1원)<br />
            포인트의 유효기간은 적립월로부터 1년간이며, 1년 경과된 포인트부터 자동 소멸됩니다. (ex : 2011년 7월 적립시 2012년 7월까지
            사용가능)<br />
            비회원인 경우 주문, 이벤트를 통한 포인트 적립이 되지 않사오니 다양한 혜택을 받으시려면 회원가입 후 주문해주세요.<br />
        </p>
        <br />
    </div>
    <div class="how_to_product_grade">
        <h3 class="how_to_title" id="grade_index">상품등급</h3>
        <p>중고상품을 사진과 설명만으로 구입해야하기에 모든 제품의 등급을 더욱 객관적이고 합리적으로 적용해서 판매하고 있습니다.</p>
        <table>
            <tr>
                <th> NS </th>
                <td>
                    새상품 도는 새상품과 동일한 상태이거나 개봉한 상태이며 부속품이 일부 없을 수 있음
                </td>
            </tr>
            <tr>
                <th> A </th>
                <td>
                    사용횟수 적은편으로 새상품에 가까운 상태, 중고 등급 중 최상
                </td>
            </tr>
            <tr>
                <th> B </th>
                <td>
                    외관상 자연스러운 사용감 있음, 전체적으로 상태가 양호한 상품
                </td>
            </tr>
        </table>
        <br />
    </div>
    <div class="how_to_sell">
        <h3 class="how_to_title" id="help_index">판매 방법</h3>
        <p> 우리 사이트에 위탁해주신 제품은 국내 최대, 최고의 온/오프라인 매장에서 동시에 판매가 되어
            판매와 회전이 가장 빠릅니다.
            업데이트 된 제품은 강남점 등 쇼핑인구 밀집지역으로 이동이 되어 판매가 이루어집니다.
            더욱 자세한 사항은 고객지원센터로 문의 주시면 친절히 안내해 드리겠습니다.
        </p>
        <br />
    </div>
</section>