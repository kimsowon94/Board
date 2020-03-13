package com.spring.board.vo;



public class PageVo {
		private String[] codeId;
	
	/*========================================*/
		private int pageSize; // 게시 글 수
	    private int firstPageNo; // 첫 번째 페이지 번호
	    private int prevPageNo; // 이전 페이지 번호
	    private int startPageNo; // 시작 페이지 (페이징 네비 기준)
	    private int pageNo1; // 페이지 번호
	   

		private int endPageNo; // 끝 페이지 (페이징 네비 기준)
	    private int nextPageNo; // 다음 페이지 번호
	    private int finalPageNo; // 마지막 페이지 번호
	    private int totalCount; // 게시 글 전체 수

	    /**
	     * @return the pageSize
	     */
	    public int getPageSize() {
	        return pageSize;
	    }

	    /**
	     * @param pageSize the pageSize to set
	     */
	    public void setPageSize(int pageSize) {
	        this.pageSize = pageSize;
	    }

	    /**
	     * @return the firstPageNo
	     */
	    public int getFirstPageNo() {
	        return firstPageNo;
	    }

	    /**
	     * @param firstPageNo the firstPageNo to set
	     */
	    public void setFirstPageNo(int firstPageNo) {
	        this.firstPageNo = firstPageNo;
	    }

	    /**
	     * @return the prevPageNo
	     */
	    public int getPrevPageNo() {
	        return prevPageNo;
	    }

	    /**
	     * @param prevPageNo the prevPageNo to set
	     */
	    public void setPrevPageNo(int prevPageNo) {
	        this.prevPageNo = prevPageNo;
	    }

	    /**
	     * @return the startPageNo
	     */
	    public int getStartPageNo() {
	        return startPageNo;
	    }

	    /**
	     * @param startPageNo the startPageNo to set
	     */
	    public void setStartPageNo(int startPageNo) {
	        this.startPageNo = startPageNo;
	    }

	    /**
	     * @return the pageNo
	     */
	    public int getPageNo1() {
			return pageNo1;
		}

		
	    /**
	     * @param pageNo the pageNo to set
	     */
	    public void setPageNo1(int pageNo1) {
			this.pageNo1 = pageNo1;
		}

	    /**
	     * @return the endPageNo
	     */
	    public int getEndPageNo() {
	        return endPageNo;
	    }

	    /**
	     * @param endPageNo the endPageNo to set
	     */
	    public void setEndPageNo(int endPageNo) {
	        this.endPageNo = endPageNo;
	    }

	    /**
	     * @return the nextPageNo
	     */
	    public int getNextPageNo() {
	        return nextPageNo;
	    }

	    /**
	     * @param nextPageNo the nextPageNo to set
	     */
	    public void setNextPageNo(int nextPageNo) {
	        this.nextPageNo = nextPageNo;
	    }

	    /**
	     * @return the finalPageNo
	     */
	    public int getFinalPageNo() {
	        return finalPageNo;
	    }

	    /**
	     * @param finalPageNo the finalPageNo to set
	     */
	    public void setFinalPageNo(int finalPageNo) {
	        this.finalPageNo = finalPageNo;
	    }

	    /**
	     * @return the totalCount
	     */
	    public int getTotalCount() {
	        return totalCount;
	    }

	    /**
	     * @param totalCount the totalCount to set
	     */
	    public void setTotalCount(int totalCount) {
	        this.totalCount = totalCount;
	        this.makePaging();
	    }

	    /**
	     * 페이징 생성
	     */
	    private void makePaging() {
	        if (this.totalCount == 0) return; // 게시 글 전체 수가 없는 경우
	        if (this.pageNo1 == 0) this.setPageNo1(1); // 기본 값 설정
	        if (this.pageSize == 0) this.setPageSize(10); // 기본 값 설정

	        int finalPage = (totalCount + (pageSize - 1)) / pageSize; // 마지막 페이지
	        if (this.pageNo1 > finalPage) this.setPageNo1(finalPage); // 기본 값 설정

	        if (this.pageNo1 < 0 || this.pageNo1 > finalPage) this.pageNo1 = 1; // 현재 페이지 유효성 체크

	        boolean isNowFirst = pageNo1 == 1 ? true : false; // 시작 페이지 (전체)
	        boolean isNowFinal = pageNo1 == finalPage ? true : false; // 마지막 페이지 (전체)

	        int startPage = ((pageNo1 - 1) / 10) * 10 + 1; // 시작 페이지 (페이징 네비 기준)
	        int endPage = startPage + 10 - 1; // 끝 페이지 (페이징 네비 기준)

	        if (endPage > finalPage) { // [마지막 페이지 (페이징 네비 기준) > 마지막 페이지] 보다 큰 경우
	            endPage = finalPage;
	        }

	        this.setFirstPageNo(1); // 첫 번째 페이지 번호

	        if (isNowFirst) {
	            this.setPrevPageNo(1); // 이전 페이지 번호
	        } else {
	            this.setPrevPageNo(((pageNo1 - 1) < 1 ? 1 : (pageNo1 - 1))); // 이전 페이지 번호
	        }

	        this.setStartPageNo(startPage); // 시작 페이지 (페이징 네비 기준)
	        this.setEndPageNo(endPage); // 끝 페이지 (페이징 네비 기준)

	        if (isNowFinal) {
	            this.setNextPageNo(finalPage); // 다음 페이지 번호
	        } else {
	        	 this.setNextPageNo(((pageNo1 + 1) > finalPage ? finalPage : (pageNo1 + 1)));

	        }

	        this.setFinalPageNo(finalPage); // 마지막 페이지 번호
	    }

	/*
	 * @Override public String toString() { return
	 * ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE); }
	 */

	
	/*========================================*/


	

	public String[] getCodeId() {
		return codeId;
	}

	public void setCodeId(String[] codeId) {
		this.codeId = codeId;
	}


	
}
