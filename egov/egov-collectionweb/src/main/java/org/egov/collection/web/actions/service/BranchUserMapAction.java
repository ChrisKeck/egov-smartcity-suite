/*
 *    eGov  SmartCity eGovernance suite aims to improve the internal efficiency,transparency,
 *    accountability and the service delivery of the government  organizations.
 *
 *     Copyright (C) 2017  eGovernments Foundation
 *
 *     The updated version of eGov suite of products as by eGovernments Foundation
 *     is available at http://www.egovernments.org
 *
 *     This program is free software: you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation, either version 3 of the License, or
 *     any later version.
 *
 *     This program is distributed in the hope that it will be useful,
 *     but WITHOUT ANY WARRANTY; without even the implied warranty of
 *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *     GNU General Public License for more details.
 *
 *     You should have received a copy of the GNU General Public License
 *     along with this program. If not, see http://www.gnu.org/licenses/ or
 *     http://www.gnu.org/licenses/gpl.html .
 *
 *     In addition to the terms of the GPL license to be adhered to in using this
 *     program, the following additional terms are to be complied with:
 *
 *         1) All versions of this program, verbatim or modified must carry this
 *            Legal Notice.
 *            Further, all user interfaces, including but not limited to citizen facing interfaces,
 *            Urban Local Bodies interfaces, dashboards, mobile applications, of the program and any
 *            derived works should carry eGovernments Foundation logo on the top right corner.
 *
 *            For the logo, please refer http://egovernments.org/html/logo/egov_logo.png.
 *            For any further queries on attribution, including queries on brand guidelines,
 *            please contact contact@egovernments.org
 *
 *         2) Any misrepresentation of the origin of the material is prohibited. It
 *            is required that all modified versions of this material be marked in
 *            reasonable ways as different from the original version.
 *
 *         3) This license does not grant any rights to any user of the program
 *            with regards to rights under trademark law for use of the trade names
 *            or trademarks of eGovernments Foundation.
 *
 *   In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
 *
 */

package org.egov.collection.web.actions.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.egov.collection.entity.BranchUserMap;
import org.egov.collection.service.BranchUserService;
import org.egov.commons.Bankbranch;
import org.egov.commons.dao.BankBranchHibernateDAO;
import org.egov.commons.dao.BankHibernateDAO;
import org.egov.infra.admin.master.entity.User;
import org.egov.infra.admin.master.service.UserService;
import org.egov.infra.web.struts.actions.BaseFormAction;
import org.springframework.beans.factory.annotation.Autowired;

@ParentPackage("egov")
@Results({ @Result(name = BranchUserMapAction.BANKBRANCHLIST, location = "branchUserMap-bankBranchList.jsp"),
		@Result(name = BranchUserMapAction.SUCCESS, location = "branchUserMap-success.jsp"),
		@Result(name = BranchUserMapAction.BEFORESEARCH, location = "branchUserMap-search.jsp"),
		@Result(name = BranchUserMapAction.SEARCH, location = "branchUserMap-search.jsp"),
		@Result(name = BranchUserMapAction.NEW, location = "branchUserMap-new.jsp") })

public class BranchUserMapAction extends BaseFormAction {
	private static final Logger LOGGER = Logger.getLogger(BranchUserMapAction.class);
	private static final long serialVersionUID = 1L;
	protected static final String BEFORECREATE = "beforeCreate";
	protected static final String SEARCH = "search";
	protected static final String BEFORESEARCH = "beforesearch";
	protected static final String MESSAGE = "message";
	private BranchUserMap branchUserMap = new BranchUserMap();
	private static final String BANK_NAME_LIST = "bankNameList";
	private static final String BANK_COLLECTION_OPERATOR_USER_LIST = "bankCollectionOperatorUserList";
	protected static final String BANKBRANCHLIST = "bankBranchList";
	private List<Bankbranch> bankBranchArrayList = new ArrayList<>(0);
	private List<BranchUserMap> branchUserList = null;
	private Integer bankId;
	private Integer branchId;
	private Long userId;
	@Autowired
	private BankHibernateDAO bankHibernateDAO;
	@Autowired
	private UserService userService;
	@Autowired
	private BankBranchHibernateDAO bankBranchHibernateDAO;
	@PersistenceContext
	private EntityManager entityManager;
	@Autowired
	private BranchUserService branchUserService;
	private Boolean isActive = Boolean.FALSE;

	public BranchUserMapAction() {
		addRelatedEntity("bankbranch", Bankbranch.class);
		addRelatedEntity("bankuser", User.class);
	}

	@Override
	public BranchUserMap getModel() {
		return branchUserMap;
	}

	@Action(value = "/service/branchUserMap-newform")
	public String newform() {
		addDropdownData(BANK_NAME_LIST, bankHibernateDAO.getAllBankHavingBranchAndAccounts());
		addDropdownData(BANKBRANCHLIST, Collections.emptyList());
		addDropdownData(BANK_COLLECTION_OPERATOR_USER_LIST, branchUserService.getBankCollectionOperator());
		return NEW;
	}

	@Action(value = "/service/branchUserMap-bankBranchsByBankForReceiptPayments")
	public String bankBranchsByBankForReceiptPayments() {
		bankBranchArrayList = bankBranchHibernateDAO.getAllBankBranchsByBankForReceiptPayments(bankId);
		return BANKBRANCHLIST;
	}

	@Action(value = "/service/branchUserMap-create")
	public String create() {
		if (LOGGER.isDebugEnabled())
			LOGGER.debug("Inside create");
		validateCreate();
		Bankbranch bankbranch = bankBranchHibernateDAO.findById(branchId, Boolean.FALSE);
		User user = userService.getUserById(userId);
		if (bankbranch == null)
			addActionError(getText("branchuser.master.branch.error"));
		if (user == null)
			addActionError(getText("branchuser.master.user.error"));
		if (hasActionErrors())
			return NEW;
		if (bankbranch != null && user != null) {
			branchUserMap.setBankbranch(bankbranch);
			branchUserMap.setIsActive(getIsActive());
			branchUserMap.setBankuser(user);
			branchUserService.persist(branchUserMap);
			addActionMessage(getText("branchuser.master.success", new String[] {
					branchUserMap.getBankuser().getUsername(), branchUserMap.getBankbranch().getBranchname() }));
		}
		if (LOGGER.isDebugEnabled())
			LOGGER.debug("end create");
		return SUCCESS;
	}

	private void validateCreate() {
		if (bankId == -1 || bankId == null)
			addActionError(getText("branchuser.master.bank.error"));
		if (branchId == -1 || branchId == null)
			addActionError(getText("branchuser.master.branch.error"));
		if (userId == -1 || userId == null)
			addActionError(getText("branchuser.master.user.error"));
	}

	public Integer getBankId() {
		return bankId;
	}

	public void setBankId(final Integer bankId) {
		this.bankId = bankId;
	}

	public List getBankBranchArrayList() {
		return bankBranchArrayList;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Integer getBranchId() {
		return branchId;
	}

	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public List<BranchUserMap> getBranchUserList() {
		return branchUserList;
	}

}
