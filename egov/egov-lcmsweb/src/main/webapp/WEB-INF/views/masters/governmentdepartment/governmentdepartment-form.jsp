<%--
  ~    eGov  SmartCity eGovernance suite aims to improve the internal efficiency,transparency,
  ~    accountability and the service delivery of the government  organizations.
  ~
  ~     Copyright (C) 2017  eGovernments Foundation
  ~
  ~     The updated version of eGov suite of products as by eGovernments Foundation
  ~     is available at http://www.egovernments.org
  ~
  ~     This program is free software: you can redistribute it and/or modify
  ~     it under the terms of the GNU General Public License as published by
  ~     the Free Software Foundation, either version 3 of the License, or
  ~     any later version.
  ~
  ~     This program is distributed in the hope that it will be useful,
  ~     but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~     GNU General Public License for more details.
  ~
  ~     You should have received a copy of the GNU General Public License
  ~     along with this program. If not, see http://www.gnu.org/licenses/ or
  ~     http://www.gnu.org/licenses/gpl.html .
  ~
  ~     In addition to the terms of the GPL license to be adhered to in using this
  ~     program, the following additional terms are to be complied with:
  ~
  ~         1) All versions of this program, verbatim or modified must carry this
  ~            Legal Notice.
  ~            Further, all user interfaces, including but not limited to citizen facing interfaces,
  ~            Urban Local Bodies interfaces, dashboards, mobile applications, of the program and any
  ~            derived works should carry eGovernments Foundation logo on the top right corner.
  ~
  ~            For the logo, please refer http://egovernments.org/html/logo/egov_logo.png.
  ~            For any further queries on attribution, including queries on brand guidelines,
  ~            please contact contact@egovernments.org
  ~
  ~         2) Any misrepresentation of the origin of the material is prohibited. It
  ~            is required that all modified versions of this material be marked in
  ~            reasonable ways as different from the original version.
  ~
  ~         3) This license does not grant any rights to any user of the program
  ~            with regards to rights under trademark law for use of the trade names
  ~            or trademarks of eGovernments Foundation.
  ~
  ~   In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
  ~
  --%>
<div class="row">
	<div class="col-md-12">
		<div class="panel panel-primary" data-collapsed="0">
			<div class="panel-heading">
				<div class="panel-title">Government Department</div>
			</div>
			<div class="panel-body">
				<div class="form-group">
					<label class="col-sm-2 control-label text-right"> <spring:message
							code="lbl.code" /> :<span class="mandatory"> </span>
					</label>
					<div class="col-sm-3 add-margin">
						<form:input path="code" class="form-control text-left aaa"
							maxlength="25" required="required" />
						<form:errors path="code" cssClass="error-msg" />
					</div>
					<label class="col-sm-2 control-label text-right"><spring:message
							code="lbl.departmentname" /> :<span class="mandatory"></span> </label>
					<div class="col-sm-3 add-margin">
						<form:input path="name" class="form-control text-left pattern"
							maxlength="128" required="required" />
						<form:errors path="name" cssClass="error-msg" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label text-right"><spring:message
							code="lbl.description" /> :</label>
					<div class="col-sm-3 add-margin">
						<form:textarea path="description"
							class="form-control text-left patternvalidation"
							data-pattern="alphanumericspecialcharacters" maxlength="256" />
						<form:errors path="description" cssClass="error-msg" />
					</div>
					<label class="col-sm-2 control-label text-right"><spring:message
							code="lbl.ordernumber" /> :</label>
					<div class="col-sm-3 add-margin">
						<form:input path="orderNumber"
							class="form-control text-left patternvalidation"
							data-pattern="number" maxlength="3" />
						<form:errors path="orderNumber" cssClass="error-msg" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label text-right"><spring:message
							code="lbl.active" /> :<span class="mandatory"></span> </label>
					<div class="col-sm-2 add-margin">
						<form:select path="active" id="active" cssClass="form-control"
							cssErrorClass="form-control error" required="required">
							<form:option value="true">YES</form:option>
							<form:option value="false">NO</form:option>
							<form:errors path="active" cssClass="error-msg" />
						</form:select>
					</div>
					<input type="hidden" name="governmentDepartment"
						value="${governmentDepartment.id}" />
				</div>
			</div>
		</div>
	</div>
</div>
