package EmbeddedCinemaAmplifierModel {

    attribute def EnabledFlag;
    attribute def LockedFlag;
    attribute def TimeLimitedFlag;
    attribute def DefaultCredentialsProhibitedFlag;
    attribute def SecureManagementRequiredFlag;

    requirement def EightChannelAudioInputRequirement;
    requirement def EightChannelAmplificationRequirement;
    requirement def EightSpeakerOutputRequirement;
    requirement def PowerSafetyRequirement;
    requirement def CommissioningProtectionRequirement;
    requirement def ProductionDebugLockRequirement;
    requirement def SecureManagementInterfaceRequirement;
    requirement def FirmwareIntegrityRequirement;
    requirement def WatchdogRecoveryRequirement;

    part def EmbeddedCinemaAmplifier {
        part audioProcessingSubsystem : AudioProcessingSubsystem;
        part amplifierBoard : EightChannelAmplifierBoard;
        part speakerOutputs : SpeakerOutputSet;
        part powerAndSafetySubsystem : PowerAndSafetySubsystem;
        part controlAndManagementSubsystem : ControlAndManagementSubsystem;
        part cybersecuritySubsystem : CybersecuritySubsystem;
        part diagnosticsAndServiceSubsystem : DiagnosticsAndServiceSubsystem;
        part verificationMatrix : VerificationMatrix;
    }

    part def AudioProcessingSubsystem {
        part audioInputSet : AudioInputSet;
        part signalProcessor : DigitalSignalProcessor;
        part audioRoutingController : AudioRoutingController;
        ref inputRequirement : EightChannelAudioInputRequirement;
    }

    part def AudioInputSet {
        part input1 : AudioInputChannel;
        part input2 : AudioInputChannel;
        part input3 : AudioInputChannel;
        part input4 : AudioInputChannel;
        part input5 : AudioInputChannel;
        part input6 : AudioInputChannel;
        part input7 : AudioInputChannel;
        part input8 : AudioInputChannel;
    }

    part def AudioInputChannel;
    part def DigitalSignalProcessor;
    part def AudioRoutingController;

    part def EightChannelAmplifierBoard {
        part channel1 : AmplifierChannel;
        part channel2 : AmplifierChannel;
        part channel3 : AmplifierChannel;
        part channel4 : AmplifierChannel;
        part channel5 : AmplifierChannel;
        part channel6 : AmplifierChannel;
        part channel7 : AmplifierChannel;
        part channel8 : AmplifierChannel;
        ref amplificationRequirement : EightChannelAmplificationRequirement;
    }

    part def AmplifierChannel;

    part def SpeakerOutputSet {
        part output1 : SpeakerOutput;
        part output2 : SpeakerOutput;
        part output3 : SpeakerOutput;
        part output4 : SpeakerOutput;
        part output5 : SpeakerOutput;
        part output6 : SpeakerOutput;
        part output7 : SpeakerOutput;
        part output8 : SpeakerOutput;
        ref speakerOutputRequirement : EightSpeakerOutputRequirement;
    }

    part def SpeakerOutput;

    part def PowerAndSafetySubsystem {
        part powerSupply : PowerSupply;
        part thermalProtection : ThermalProtectionController;
        part overCurrentProtection : OverCurrentProtectionController;
        part faultIsolationController : FaultIsolationController;
        ref powerSafetyRequirement : PowerSafetyRequirement;
    }

    part def PowerSupply;
    part def ThermalProtectionController;
    part def OverCurrentProtectionController;
    part def FaultIsolationController;

    part def ControlAndManagementSubsystem {
        part controlProcessor : ControlProcessor;
        part commissioningManager : CommissioningManager;
        part configurationManager : ConfigurationManager;
        part networkInterface : NetworkInterface;
        ref commissioningProtectionRequirement : CommissioningProtectionRequirement;
    }

    part def ControlProcessor;

    part def CommissioningManager {
        part lockoutController : LockoutController;
        part auditLogger : AuditLogger;
    }

    part def ConfigurationManager {
        attribute defaultCredentialsProhibited : DefaultCredentialsProhibitedFlag;
    }

    part def NetworkInterface {
        part managementEndpoint : ManagementEndpoint;
        part attackGuard : NetworkAttackGuard;
        attribute secureManagementOnly : SecureManagementRequiredFlag;
        ref secureManagementRequirement : SecureManagementInterfaceRequirement;
    }

    part def ManagementEndpoint;
    part def LockoutController;
    part def AuditLogger;
    part def NetworkAttackGuard;

    part def CybersecuritySubsystem {
        part credentialManager : CredentialManager;
        part networkAttackGuard : NetworkAttackGuard;
        part auditLogger : AuditLogger;
        ref secureManagementInterfaceRequirement : SecureManagementInterfaceRequirement;
    }

    part def CredentialManager {
        attribute defaultCredentialsProhibited : DefaultCredentialsProhibitedFlag;
    }

    part def DiagnosticsAndServiceSubsystem {
        part debugInterfaceController : DebugInterfaceController;
        part signedServiceUnlock : SignedServiceUnlock;
        part firmwareUpdateController : FirmwareUpdateController;
        part presetRollbackController : PresetRollbackController;
        part watchdog : Watchdog;
        ref productionDebugLockRequirement : ProductionDebugLockRequirement;
        ref firmwareIntegrityRequirement : FirmwareIntegrityRequirement;
        ref watchdogRecoveryRequirement : WatchdogRecoveryRequirement;
    }

    part def DebugInterfaceController {
        attribute lockedInProduction : LockedFlag;
        ref unlockAuthority : SignedServiceUnlock;
    }

    part def SignedServiceUnlock {
        attribute timeLimited : TimeLimitedFlag;
        ref unlockedDebugInterface : DebugInterfaceController;
    }

    part def FirmwareUpdateController;
    part def PresetRollbackController;
    part def Watchdog;

    part def VerificationMatrix {
        part audioVerification : AudioVerification;
        part powerSafetyVerification : PowerSafetyVerification;
        part softwareVerification : SoftwareVerification;
        part cybersecurityVerification : CybersecurityVerification;
    }

    part def AudioVerification {
        ref verifiesInputRequirement : EightChannelAudioInputRequirement;
        ref verifiesAmplificationRequirement : EightChannelAmplificationRequirement;
        ref verifiesOutputRequirement : EightSpeakerOutputRequirement;
        ref verifiedAudioSubsystem : AudioProcessingSubsystem;
        ref verifiedAmplifierBoard : EightChannelAmplifierBoard;
        ref verifiedSpeakerOutputs : SpeakerOutputSet;
    }

    part def PowerSafetyVerification {
        ref verifiesPowerSafetyRequirement : PowerSafetyRequirement;
        ref verifiedPowerAndSafetySubsystem : PowerAndSafetySubsystem;
    }

    part def SoftwareVerification {
        ref verifiedSoftwareSubsystem : ControlAndManagementSubsystem;
        ref verifiedDiagnosticsSubsystem : DiagnosticsAndServiceSubsystem;
        ref verifiesCommissioningProtectionRequirement : CommissioningProtectionRequirement;
        ref verifiesProductionDebugLockRequirement : ProductionDebugLockRequirement;
        ref verifiesFirmwareIntegrityRequirement : FirmwareIntegrityRequirement;
        ref verifiesWatchdogRecoveryRequirement : WatchdogRecoveryRequirement;
    }

    part def CybersecurityVerification {
        ref verifiedCybersecuritySubsystem : CybersecuritySubsystem;
        ref verifiedNetworkInterface : NetworkInterface;
        ref verifiesSecureManagementInterfaceRequirement : SecureManagementInterfaceRequirement;
    }

    part embeddedCinemaAmplifier : EmbeddedCinemaAmplifier;
}
