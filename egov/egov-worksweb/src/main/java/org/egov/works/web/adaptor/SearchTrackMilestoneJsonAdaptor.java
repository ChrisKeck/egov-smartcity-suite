/*
 * eGov suite of products aim to improve the internal efficiency,transparency,
 *    accountability and the service delivery of the government  organizations.
 *
 *     Copyright (C) <2015>  eGovernments Foundation
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
 */
package org.egov.works.web.adaptor;

import java.lang.reflect.Type;

import org.egov.commons.EgwStatus;
import org.egov.commons.EgwTypeOfWork;
import org.egov.infra.utils.StringUtils;
import org.egov.works.abstractestimate.entity.AbstractEstimate;
import org.egov.works.lineestimate.entity.LineEstimateDetails;
import org.egov.works.milestone.entity.Milestone;
import org.egov.works.milestone.entity.TrackMilestone;
import org.egov.works.workorder.entity.WorkOrder;
import org.egov.works.workorder.entity.WorkOrderEstimate;
import org.springframework.stereotype.Component;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

@Component
public class SearchTrackMilestoneJsonAdaptor implements JsonSerializer<TrackMilestone> {

    @Override
    public JsonElement serialize(final TrackMilestone trackMilestone, final Type type,
            final JsonSerializationContext jsc) {
        final JsonObject jsonObject = new JsonObject();
        if (trackMilestone != null) {
            final Milestone ms = trackMilestone.getMilestone();
            final WorkOrderEstimate woe = ms.getWorkOrderEstimate();
            final WorkOrder wo = woe.getWorkOrder();
            final AbstractEstimate ae = woe.getEstimate();
            final EgwStatus status = trackMilestone.getStatus();
            setAbstractEstimateJsonValues(jsonObject, ae);
            jsonObject.addProperty("agreementAmount",
                    wo != null ? Double.toString(wo.getWorkOrderAmount()) : StringUtils.EMPTY);
            jsonObject.addProperty("workOrderNumber", wo != null ? wo.getWorkOrderNumber() : StringUtils.EMPTY);
            jsonObject.addProperty("workOrderId", wo != null ? wo.getId().toString() : StringUtils.EMPTY);
            jsonObject.addProperty("status", status != null ? status.getCode() : StringUtils.EMPTY);
            jsonObject.addProperty("id", trackMilestone.getMilestone().getId());
            jsonObject.addProperty("total", trackMilestone.getTotalPercentage());
        }
        return jsonObject;
    }

    private void setAbstractEstimateJsonValues(final JsonObject jsonObject, final AbstractEstimate ae) {
        jsonObject.addProperty("estimateNumber", ae != null ? ae.getEstimateNumber() : StringUtils.EMPTY);
        jsonObject.addProperty("workIdentificationNumber",
                ae != null ? ae.getProjectCode().getCode() : StringUtils.EMPTY);
        jsonObject.addProperty("nameOfWork", ae != null ? ae.getName() : StringUtils.EMPTY);
        jsonObject.addProperty("department", ae != null ? ae.getExecutingDepartment().getName() : StringUtils.EMPTY);
        if (ae != null) {
            final EgwTypeOfWork typeOfWork = ae.getParentCategory();
            final EgwTypeOfWork subTypeOfWork = ae.getCategory();
            final LineEstimateDetails led = ae.getLineEstimateDetails();
            jsonObject.addProperty("typeOfWork", typeOfWork != null ? typeOfWork.getName() : StringUtils.EMPTY);
            jsonObject.addProperty("subTypeOfWork",
                    subTypeOfWork != null ? subTypeOfWork.getName() : StringUtils.EMPTY);
            jsonObject.addProperty("lineEstimateId",
                    led != null ? led.getLineEstimate().getId().toString() : StringUtils.EMPTY);
            jsonObject.addProperty("abstractEstimateId", ae.getId().toString());
        }
    }
}
