package com.odtn.camping.dto;

public class CampingDto {
	
	private int campingCount;
	private int ownerCount;
	private int recommandCount;
	private int memberCount;
	
	CampingDto() {
		
	}

	public CampingDto(int campingCount, int ownerCount, int recommandCount, int memberCount) {
		super();
		this.campingCount = campingCount;
		this.ownerCount = ownerCount;
		this.recommandCount = recommandCount;
		this.memberCount = memberCount;
	}

	public int getCampingCount() {
		return campingCount;
	}

	public void setCampingCount(int campingCount) {
		this.campingCount = campingCount;
	}

	public int getOwnerCount() {
		return ownerCount;
	}

	public void setOwnerCount(int ownerCount) {
		this.ownerCount = ownerCount;
	}

	public int getRecommandCount() {
		return recommandCount;
	}

	public void setRecommandCount(int recommandCount) {
		this.recommandCount = recommandCount;
	}

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}

	@Override
	public String toString() {
		return "CampingDto [campingCount=" + campingCount + ", ownerCount=" + ownerCount + ", recommandCount="
				+ recommandCount + ", memberCount=" + memberCount + "]";
	}
	
}
