﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Appointment_management_system_integration.Properties {
    
    
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "12.0.0.0")]
    internal sealed partial class Settings : global::System.Configuration.ApplicationSettingsBase {
        
        private static Settings defaultInstance = ((Settings)(global::System.Configuration.ApplicationSettingsBase.Synchronized(new Settings())));
        
        public static Settings Default {
            get {
                return defaultInstance;
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.WebServiceUrl)]
        [global::System.Configuration.DefaultSettingValueAttribute("http://192.168.113.119/ndplwebservice/list.asmx")]
        public string Appointment_management_system_integration_weblist_list {
            get {
                return ((string)(this["Appointment_management_system_integration_weblist_list"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.WebServiceUrl)]
        [global::System.Configuration.DefaultSettingValueAttribute("http://piprd:50000/XISOAPAdapter/MessageServlet?senderParty=&senderService=Sys_We" +
            "bsite_P&receiverParty=&receiverService=&interface=RequestTracking_Website_Out&in" +
            "terfaceNamespace=urn%3ANDPL.com%3AISU%3ACS%3ARequestTracking")]
        public string Appointment_management_system_integration_notificationstatus_RequestTracking_Website_OutService {
            get {
                return ((string)(this["Appointment_management_system_integration_notificationstatus_RequestTracking_Webs" +
                    "ite_OutService"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.WebServiceUrl)]
        [global::System.Configuration.DefaultSettingValueAttribute("http://piprd:50000/XISOAPAdapter/MessageServlet?senderParty=&senderService=Sys_We" +
            "bsite_P&receiverParty=&receiverService=&interface=OutstandingBill_Website_Out&in" +
            "terfaceNamespace=urn%3ANDPL.com%3AISU%3ACS%3APayment")]
        public string Appointment_management_system_integration_canostatus_OutstandingBill_Website_OutService {
            get {
                return ((string)(this["Appointment_management_system_integration_canostatus_OutstandingBill_Website_OutS" +
                    "ervice"]));
            }
        }
    }
}
