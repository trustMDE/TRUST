package EmbeddedCinemaAmplifierModel {

	requirement def AudioProcessingRequirement {
		doc /* The amplifier shall decode, process, amplify, and route cinema audio channels to the configured speaker outputs. */
	}

	requirement def PowerSafetyRequirement {
		doc /* The amplifier shall provide managed mains power conversion, energy management, and emergency mute power handling. */
	}

	requirement def ProtectionRequirement {
		doc /* The amplifier shall detect load, thermal, relay, and internal faults and transition to a fail-safe state when required. */
	}

	requirement def CybersecurityRequirement {
		doc /* The amplifier shall protect management services, credentials, certificates, debug access, and remote update mechanisms. */
	}

	requirement def VerificationRequirement {
		doc /* The amplifier shall include verification capabilities for audio, power safety, software, cybersecurity, and EMC pre-compliance. */
	}

	part def EmbeddedCinemaAmplifier {
		part audioSubsystem : AudioSubsystem;
		part powerSubsystem : PowerSubsystem;
		part protectionSubsystem : ProtectionSubsystem;
		part controlAndManagementSubsystem : ControlAndManagementSubsystem;
		part cybersecuritySubsystem : CybersecuritySubsystem;
		part commissioningSubsystem : CommissioningSubsystem;
		part mechanicalThermalSubsystem : MechanicalThermalSubsystem;
		part testAndVerificationSubsystem : TestAndVerificationSubsystem;
	}

	part def AudioSubsystem {
		part audioInput : AudioInput;
		part digitalSignalProcessor : DigitalSignalProcessor;
		part amplifierChannel : PowerAmplifierChannel;
		part audioOutputSubsystem : AudioOutputSubsystem;
	}

	part def AudioInput;
	part def DigitalSignalProcessor;

	part def PowerAmplifierChannel {
		part outputStage : OutputStage;
	}

	part def OutputStage;

	part def AudioOutputSubsystem {
		part frontLeftOutput : SpeakerOutput;
		part frontRightOutput : SpeakerOutput;
		part centerOutput : SpeakerOutput;
		part sideSurroundLeftOutput : SpeakerOutput;
		part sideSurroundRightOutput : SpeakerOutput;
		part rearSurroundLeftOutput : SpeakerOutput;
		part rearSurroundRightOutput : SpeakerOutput;
		part lfeOutput : SpeakerOutput;
	}

	part def SpeakerOutput;

	part def PowerSubsystem {
		part mainsInput : MainsInput;
		part powerSupply : PowerSupply;
		part energyManagement : EnergyManagement;
		part emergencyMutePowerPath : EmergencyMutePowerPath;
	}

	part def MainsInput;
	part def PowerSupply;
	part def EnergyManagement;
	part def EmergencyMutePowerPath;

	part def ProtectionSubsystem {
		part loadMonitor : LoadMonitor;
		part thermalMonitor : ThermalMonitor;
		part relayMonitor : RelayMonitor;
		part faultManager : FaultManager;
		part failSafeController : FailSafeController;
	}

	part def LoadMonitor {
		part shortedLoadDetector : ShortedLoadDetector;
		part openLoadDetector : OpenLoadDetector;
		part lowImpedanceDetector : LowImpedanceDetector;
	}

	part def ShortedLoadDetector;
	part def OpenLoadDetector;
	part def LowImpedanceDetector;

	part def ThermalMonitor {
		part temperatureSensors : TemperatureSensorBank;
		part fanBlockedDetector : FanBlockedDetector;
	}

	part def TemperatureSensorBank;
	part def FanBlockedDetector;
	part def RelayMonitor;
	part def FaultManager;
	part def FailSafeController;

	part def ControlAndManagementSubsystem {
		part embeddedController : EmbeddedController;
		part gpioInterface : GpioInterface;
		part remoteHealthReporter : RemoteHealthReporter;
		part fleetManagementAgent : FleetManagementAgent;
		part auditLogger : AuditLogger;
		part softwareUpdateManager : SoftwareUpdateManager;
	}

	part def EmbeddedController;
	part def GpioInterface;
	part def RemoteHealthReporter;
	part def FleetManagementAgent;
	part def AuditLogger;

	part def SoftwareUpdateManager {
		part firmwareVerifier : FirmwareVerifier;
		part rollbackManager : RollbackManager;
	}

	part def FirmwareVerifier;
	part def RollbackManager;

	part def CybersecuritySubsystem {
		part managementServiceGate : ManagementServiceGate;
		part credentialManager : CredentialManager;
		part tlsEndpoint : TlsEndpoint;
		part certificateStore : CertificateStore;
		part roleBasedAccessControl : RoleBasedAccessControl;
		part lockoutManager : LockoutManager;
		part debugInterfaceLock : DebugInterfaceLock;
		part signedServiceUnlock : SignedServiceUnlock;
		part networkAttackResilienceManager : NetworkAttackResilienceManager;
	}

	part def ManagementServiceGate;
	part def CredentialManager;
	part def TlsEndpoint;
	part def CertificateStore;
	part def RoleBasedAccessControl;
	part def LockoutManager;
	part def DebugInterfaceLock;
	part def SignedServiceUnlock;
	part def NetworkAttackResilienceManager;

	part def CommissioningSubsystem {
		part installerInterface : InstallerInterface;
		part channelIdentificationTool : ChannelIdentificationTool;
		part presetLockManager : PresetLockManager;
		part certificateProvisioningTool : CertificateProvisioningTool;
	}

	part def InstallerInterface;
	part def ChannelIdentificationTool;
	part def PresetLockManager;
	part def CertificateProvisioningTool;

	part def MechanicalThermalSubsystem {
		part enclosure : Enclosure;
		part heatsinkAssembly : HeatsinkAssembly;
		part fanAssembly : FanAssembly;
		part emcProtectionAssembly : EmcProtectionAssembly;
		part surgeBurstProtection : SurgeBurstProtection;
	}

	part def Enclosure;
	part def HeatsinkAssembly;
	part def FanAssembly;
	part def EmcProtectionAssembly;
	part def SurgeBurstProtection;

	part def TestAndVerificationSubsystem {
		part audioVerification : AudioVerification;
		part powerSafetyVerification : PowerSafetyVerification;
		part softwareVerification : SoftwareVerification;
		part cybersecurityVerification : CybersecurityVerification;
		part emcPreComplianceVerification : EmcPreComplianceVerification;
	}

	part def AudioVerification;
	part def PowerSafetyVerification;
	part def SoftwareVerification;
	part def CybersecurityVerification;
	part def EmcPreComplianceVerification;

	part cinemaAmplifier : EmbeddedCinemaAmplifier;
}
