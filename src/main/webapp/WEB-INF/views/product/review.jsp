<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">/* 
	$(function() {
		var score;
		$(".star-5").each(function() {
			score = $(this).attr("data-score") / 5 * 100;
			$(this).css({
				width : score + "%"
			})
		});
		$(".user-name").each(function() {
			var userName = $(this).attr("data-writer");
			$(this).children().text(userName.substring(0,1)+"*"+userName.substring(2,3));
		});
	}) */
</script>
<div class="detail-reviewlist-summary">
	<div class="n-review-read">
		<ul id="review-summary">
			<c:choose>
				<c:when test="${empty list}">
					<div class="uk-grid detail-review-summary">
						<div class="uk-width-large-1-3 summary-sect">
							<div class="review-noti">이 상품의 첫 번째 리뷰를 작성해 주세요.</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="dto">
						<li id="num" data-reviewid="${dto.num}">
							<div class="uk-grid">
								<div class="read-list uk-width-large-2-3">
									<p class="read-subject">${dto.title}</p>
									<p class="user-info">
										<span class="review-filter star like"
											data-productid="${dto.productcode}"> <i
											class="brz-icon-star_small star-5 per"
											data-score="${dto.score}"></i> <i class="brz-icon-star_small"></i>
										</span>
									</p>
									<div class="user-name" data-writer="${dto.writer}">
										<span></span>
									</div>
									<span class="write-date">${dto.reg_date}</span>
									<c:if test="${dto.writer eq member.name}">
										<button class="btn btn-default btn-xs btn-del"
											style="float: right;">삭제</button>
									</c:if>
									<p class="read-comment shorten-txt">${dto.contents}</p>
								</div>
							</div>
						</li>
					</c:forEach>
					<c:if test="${next}">
						<a class="btn-more-review">더 많은 리뷰 보기</a>
					</c:if>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>