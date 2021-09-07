﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by Microsoft.VSDesigner, Version 4.0.30319.42000.
// 
#pragma warning disable 1591

namespace Appointment_management_system_integration.canostatus {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.Xml.Serialization;
    using System.ComponentModel;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.3752.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="OutstandingBill_Website_OutBinding", Namespace="urn:NDPL.com:ISU:CS:Payment")]
    public partial class OutstandingBill_Website_OutService : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback OutstandingBill_Website_OutOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public OutstandingBill_Website_OutService() {
            this.Url = global::Appointment_management_system_integration.Properties.Settings.Default.Appointment_management_system_integration_canostatus_OutstandingBill_Website_OutService;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event OutstandingBill_Website_OutCompletedEventHandler OutstandingBill_Website_OutCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://sap.com/xi/WebService/soap1.1", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Bare)]
        [return: System.Xml.Serialization.XmlElementAttribute("OutstandingBillResponse", Namespace="urn:NDPL.com:ISU:CS:Payment")]
        public OutstandingBillResponse OutstandingBill_Website_Out([System.Xml.Serialization.XmlElementAttribute(Namespace="urn:NDPL.com:ISU:CS:Payment")] OutstandingBillRequest OutstandingBillRequest) {
            object[] results = this.Invoke("OutstandingBill_Website_Out", new object[] {
                        OutstandingBillRequest});
            return ((OutstandingBillResponse)(results[0]));
        }
        
        /// <remarks/>
        public void OutstandingBill_Website_OutAsync(OutstandingBillRequest OutstandingBillRequest) {
            this.OutstandingBill_Website_OutAsync(OutstandingBillRequest, null);
        }
        
        /// <remarks/>
        public void OutstandingBill_Website_OutAsync(OutstandingBillRequest OutstandingBillRequest, object userState) {
            if ((this.OutstandingBill_Website_OutOperationCompleted == null)) {
                this.OutstandingBill_Website_OutOperationCompleted = new System.Threading.SendOrPostCallback(this.OnOutstandingBill_Website_OutOperationCompleted);
            }
            this.InvokeAsync("OutstandingBill_Website_Out", new object[] {
                        OutstandingBillRequest}, this.OutstandingBill_Website_OutOperationCompleted, userState);
        }
        
        private void OnOutstandingBill_Website_OutOperationCompleted(object arg) {
            if ((this.OutstandingBill_Website_OutCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.OutstandingBill_Website_OutCompleted(this, new OutstandingBill_Website_OutCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.8.3752.0")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="urn:NDPL.com:ISU:CS:Payment")]
    public partial class OutstandingBillRequest {
        
        private string vKONTField;
        
        private string bLTYPField;
        
        private string qMNUMField;
        
        private string pAYMENTField;
        
        private string tYPEField;
        
        private string zZCNTRNField;
        
        private string bUDATField;
        
        private string pAYIDField;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string VKONT {
            get {
                return this.vKONTField;
            }
            set {
                this.vKONTField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string BLTYP {
            get {
                return this.bLTYPField;
            }
            set {
                this.bLTYPField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string QMNUM {
            get {
                return this.qMNUMField;
            }
            set {
                this.qMNUMField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string PAYMENT {
            get {
                return this.pAYMENTField;
            }
            set {
                this.pAYMENTField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string TYPE {
            get {
                return this.tYPEField;
            }
            set {
                this.tYPEField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string ZZCNTRN {
            get {
                return this.zZCNTRNField;
            }
            set {
                this.zZCNTRNField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string BUDAT {
            get {
                return this.bUDATField;
            }
            set {
                this.bUDATField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string PAYID {
            get {
                return this.pAYIDField;
            }
            set {
                this.pAYIDField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.8.3752.0")]
    [System.SerializableAttribute()]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="urn:NDPL.com:ISU:CS:Payment")]
    public partial class OutstandingBillResponse {
        
        private string contractAccountField;
        
        private string legacyKNOField;
        
        private string nameField;
        
        private string supplierAddressField;
        
        private string billNoField;
        
        private string lastBillGenerationDateField;
        
        private string lastBillDueDateField;
        
        private string lastOutstandingAmountTotalField;
        
        private string lastBillCurrentDemandAmountField;
        
        private string segmentField;
        
        private string prepaymentMeterField;
        
        private string contractClassField;
        
        private string classificationField;
        
        private string installationTypeField;
        
        private string billingClassField;
        
        private string billTypeField;
        
        private string notificationNumberField;
        
        private string tariffTypeField;
        
        private string supplyTypeField;
        
        private string sanLoadField;
        
        private string blindStatusField;
        
        private string legalEntyField;
        
        private string legalOrganizationField;
        
        private string moveOutDateField;
        
        private string securityAmtWithoutRefNumberField;
        
        private string securityDepositAmtField;
        
        private string demandNoteAmtField;
        
        private string demandNoteSecDepositAmtField;
        
        private string paymentDueDateField;
        
        private string notificationTypeField;
        
        private string priorityField;
        
        private string installmentPlancategoryField;
        
        private string cCPaymentField;
        
        private string rCVRYTTLAMTField;
        
        private string rECPERCField;
        
        private string aSESTTLAMTField;
        
        private string rCVRYAMTField;
        
        private string aSESAMTField;
        
        private string tKNAMTField;
        
        private string gERAETField;
        
        private string hERSTField;
        
        private string sTAT_DESCField;
        
        private string eXCEPTONField;
        
        private string tOKENSField;
        
        private string lAST_BILL_TTLAMTField;
        
        private string cASHPAYMENTField;
        
        private string tELNR_LANDLINEField;
        
        private string tELNR_MOBILEField;
        
        private string aBRVORGField;
        
        private string eMAILField;
        
        private string tYPEField;
        
        private string pDFField;
        
        private string pDF_DTLSField;
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string ContractAccount {
            get {
                return this.contractAccountField;
            }
            set {
                this.contractAccountField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string LegacyKNO {
            get {
                return this.legacyKNOField;
            }
            set {
                this.legacyKNOField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Name {
            get {
                return this.nameField;
            }
            set {
                this.nameField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string SupplierAddress {
            get {
                return this.supplierAddressField;
            }
            set {
                this.supplierAddressField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string BillNo {
            get {
                return this.billNoField;
            }
            set {
                this.billNoField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string LastBillGenerationDate {
            get {
                return this.lastBillGenerationDateField;
            }
            set {
                this.lastBillGenerationDateField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string LastBillDueDate {
            get {
                return this.lastBillDueDateField;
            }
            set {
                this.lastBillDueDateField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string LastOutstandingAmountTotal {
            get {
                return this.lastOutstandingAmountTotalField;
            }
            set {
                this.lastOutstandingAmountTotalField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string LastBillCurrentDemandAmount {
            get {
                return this.lastBillCurrentDemandAmountField;
            }
            set {
                this.lastBillCurrentDemandAmountField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Segment {
            get {
                return this.segmentField;
            }
            set {
                this.segmentField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string PrepaymentMeter {
            get {
                return this.prepaymentMeterField;
            }
            set {
                this.prepaymentMeterField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string ContractClass {
            get {
                return this.contractClassField;
            }
            set {
                this.contractClassField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Classification {
            get {
                return this.classificationField;
            }
            set {
                this.classificationField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string InstallationType {
            get {
                return this.installationTypeField;
            }
            set {
                this.installationTypeField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string BillingClass {
            get {
                return this.billingClassField;
            }
            set {
                this.billingClassField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string BillType {
            get {
                return this.billTypeField;
            }
            set {
                this.billTypeField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string NotificationNumber {
            get {
                return this.notificationNumberField;
            }
            set {
                this.notificationNumberField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string TariffType {
            get {
                return this.tariffTypeField;
            }
            set {
                this.tariffTypeField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string SupplyType {
            get {
                return this.supplyTypeField;
            }
            set {
                this.supplyTypeField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string SanLoad {
            get {
                return this.sanLoadField;
            }
            set {
                this.sanLoadField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string BlindStatus {
            get {
                return this.blindStatusField;
            }
            set {
                this.blindStatusField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string LegalEnty {
            get {
                return this.legalEntyField;
            }
            set {
                this.legalEntyField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string LegalOrganization {
            get {
                return this.legalOrganizationField;
            }
            set {
                this.legalOrganizationField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string MoveOutDate {
            get {
                return this.moveOutDateField;
            }
            set {
                this.moveOutDateField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string SecurityAmtWithoutRefNumber {
            get {
                return this.securityAmtWithoutRefNumberField;
            }
            set {
                this.securityAmtWithoutRefNumberField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string SecurityDepositAmt {
            get {
                return this.securityDepositAmtField;
            }
            set {
                this.securityDepositAmtField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string DemandNoteAmt {
            get {
                return this.demandNoteAmtField;
            }
            set {
                this.demandNoteAmtField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string DemandNoteSecDepositAmt {
            get {
                return this.demandNoteSecDepositAmtField;
            }
            set {
                this.demandNoteSecDepositAmtField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string PaymentDueDate {
            get {
                return this.paymentDueDateField;
            }
            set {
                this.paymentDueDateField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string NotificationType {
            get {
                return this.notificationTypeField;
            }
            set {
                this.notificationTypeField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string Priority {
            get {
                return this.priorityField;
            }
            set {
                this.priorityField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string InstallmentPlancategory {
            get {
                return this.installmentPlancategoryField;
            }
            set {
                this.installmentPlancategoryField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string CCPayment {
            get {
                return this.cCPaymentField;
            }
            set {
                this.cCPaymentField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string RCVRYTTLAMT {
            get {
                return this.rCVRYTTLAMTField;
            }
            set {
                this.rCVRYTTLAMTField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string RECPERC {
            get {
                return this.rECPERCField;
            }
            set {
                this.rECPERCField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string ASESTTLAMT {
            get {
                return this.aSESTTLAMTField;
            }
            set {
                this.aSESTTLAMTField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string RCVRYAMT {
            get {
                return this.rCVRYAMTField;
            }
            set {
                this.rCVRYAMTField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string ASESAMT {
            get {
                return this.aSESAMTField;
            }
            set {
                this.aSESAMTField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string TKNAMT {
            get {
                return this.tKNAMTField;
            }
            set {
                this.tKNAMTField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string GERAET {
            get {
                return this.gERAETField;
            }
            set {
                this.gERAETField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string HERST {
            get {
                return this.hERSTField;
            }
            set {
                this.hERSTField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string STAT_DESC {
            get {
                return this.sTAT_DESCField;
            }
            set {
                this.sTAT_DESCField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string EXCEPTON {
            get {
                return this.eXCEPTONField;
            }
            set {
                this.eXCEPTONField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string TOKENS {
            get {
                return this.tOKENSField;
            }
            set {
                this.tOKENSField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string LAST_BILL_TTLAMT {
            get {
                return this.lAST_BILL_TTLAMTField;
            }
            set {
                this.lAST_BILL_TTLAMTField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string CASHPAYMENT {
            get {
                return this.cASHPAYMENTField;
            }
            set {
                this.cASHPAYMENTField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string TELNR_LANDLINE {
            get {
                return this.tELNR_LANDLINEField;
            }
            set {
                this.tELNR_LANDLINEField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string TELNR_MOBILE {
            get {
                return this.tELNR_MOBILEField;
            }
            set {
                this.tELNR_MOBILEField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string ABRVORG {
            get {
                return this.aBRVORGField;
            }
            set {
                this.aBRVORGField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string EMAIL {
            get {
                return this.eMAILField;
            }
            set {
                this.eMAILField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string TYPE {
            get {
                return this.tYPEField;
            }
            set {
                this.tYPEField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string PDF {
            get {
                return this.pDFField;
            }
            set {
                this.pDFField = value;
            }
        }
        
        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(Form=System.Xml.Schema.XmlSchemaForm.Unqualified)]
        public string PDF_DTLS {
            get {
                return this.pDF_DTLSField;
            }
            set {
                this.pDF_DTLSField = value;
            }
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.3752.0")]
    public delegate void OutstandingBill_Website_OutCompletedEventHandler(object sender, OutstandingBill_Website_OutCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.8.3752.0")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class OutstandingBill_Website_OutCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal OutstandingBill_Website_OutCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public OutstandingBillResponse Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((OutstandingBillResponse)(this.results[0]));
            }
        }
    }
}

#pragma warning restore 1591