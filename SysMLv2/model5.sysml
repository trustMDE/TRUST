package EmbeddedCinemaAmplifierModel {

	requirement def ContinuousAudioAvailability {
		doc /* The amplifier shall maintain continuous multichannel audio output during normal operation. */
	}

	requirement def DeterministicAudioRouting {
		doc /* Audio routing shall be deterministic for all configured cinema channels. */
	}

	requirement def SpareChannelEquivalence {
		doc /* The spare amplifier channel shall provide the same structural interface as an active amplifier channel. */
	}

	requirement def ThermalProtectionIntegration {
		doc /* Thermal protection shall use enclosure temperature sensing and cooling capability to prevent unsafe operation. */
	}

	requirement def ProductionDebugLockControl {
		doc /* Production debug access shall be locked by default and unlocked only through an authenticated service mechanism. */
	}

	requirement def NetworkCybersecurity {
		doc /* Network management interfaces shall use authenticated, encrypted, role-based access. */
	}

	part def EmbeddedCinemaAmplifier {
		part audioInputSubsystem : AudioInputSubsystem;
		part signalProcessingSubsystem : SignalProcessingSubsystem;
		part amplifierOutputSubsystem : AmplifierOutputSubsystem;
		part protectionAndSafetySubsystem : ProtectionAndSafetySubsystem;
		part controlAndManagementSubsystem : ControlAndManagementSubsystem;
		part powerSubsystem : PowerSubsystem;
		part enclosureAndThermalSubsystem : EnclosureAndThermalSubsystem;
		part commissioningAndServiceSubsystem : CommissioningAndServiceSubsystem;
	}

	part def AudioInputSubsystem {
		part digitalAudioInput : DigitalAudioInput;
		part analogAudioInput : AnalogAudioInput;
		part inputSignalConditioner : InputSignalConditioner;
	}

	part def DigitalAudioInput;
	part def AnalogAudioInput;
	part def InputSignalConditioner;

	part def SignalProcessingSubsystem {
		part deterministicRoutingEngine : DeterministicRoutingEngine;
		part digitalSignalProcessor : DigitalSignalProcessor;
		part equalizationProcessor : EqualizationProcessor;
		part limiterProcessor : LimiterProcessor;
		part muteController : MuteController;
	}

	part def DeterministicRoutingEngine;
	part def DigitalSignalProcessor;
	part def EqualizationProcessor;
	part def LimiterProcessor;
	part def MuteController;

	part def AmplifierOutputSubsystem {
		part leftAmplifierChannel : AmplifierChannel;
		part centerAmplifierChannel : AmplifierChannel;
		part rightAmplifierChannel : AmplifierChannel;
		part leftSurroundAmplifierChannel : AmplifierChannel;
		part rightSurroundAmplifierChannel : AmplifierChannel;
		part auxiliarySurroundAmplifierChannel : AmplifierChannel;
		part spareAmplifierChannel : SpareAmplifierChannel;
		part outputConnectorSet : OutputConnectorSet;
	}

	part def AmplifierChannel {
		part powerStage : PowerStage;
		part outputRelay : OutputRelay;
		part loadSensor : LoadSensor;
	}

	part def SpareAmplifierChannel :> AmplifierChannel;
	part def PowerStage;
	part def OutputRelay;
	part def LoadSensor;
	part def OutputConnectorSet;

	part def ProtectionAndSafetySubsystem {
		part shortedLoadProtection : ShortedLoadProtection;
		part openLoadDetection : OpenLoadDetection;
		part lowImpedanceProtection : LowImpedanceProtection;
		part thermalProtection : ThermalProtection;
		part emergencyMuteController : EmergencyMuteController;
		part relayWeldDetector : RelayWeldDetector;
		part watchdogSupervisor : WatchdogSupervisor;
		part failSafeController : FailSafeController;
	}

	part def ShortedLoadProtection;
	part def OpenLoadDetection;
	part def LowImpedanceProtection;

	part def ThermalProtection {
		ref part temperatureSensorSet : TemperatureSensorSet;
		ref part coolingSystem : CoolingSystem;
		part thermalLimitController : ThermalLimitController;
	}

	part def ThermalLimitController;
	part def EmergencyMuteController;
	part def RelayWeldDetector;
	part def WatchdogSupervisor;
	part def FailSafeController;

	part def ControlAndManagementSubsystem {
		part embeddedController : EmbeddedController;
		part networkManagementService : NetworkManagementService;
		part fleetMonitoringService : FleetMonitoringService;
		part gpioInterface : GpioInterface;
		part energyManagementController : EnergyManagementController;
		part auditLogger : AuditLogger;
		part cybersecurityController : CybersecurityController;
	}

	part def EmbeddedController;
	part def NetworkManagementService;
	part def FleetMonitoringService;
	part def GpioInterface;
	part def EnergyManagementController;
	part def AuditLogger;

	part def CybersecurityController {
		part tlsEndpoint : TlsEndpoint;
		part certificateStore : CertificateStore;
		part roleBasedAccountStore : RoleBasedAccountStore;
		part lockoutManager : LockoutManager;
		part secureUpdateManager : SecureUpdateManager;
		part productionDebugInterfaceLock : ProductionDebugInterfaceLock;
	}

	part def TlsEndpoint;
	part def CertificateStore;
	part def RoleBasedAccountStore;
	part def LockoutManager;
	part def SecureUpdateManager;

	part def DebugLockController {
		part signedServiceUnlockTokenVerifier : SignedServiceUnlockTokenVerifier;
	}

	part def ProductionDebugInterfaceLock :> DebugLockController;
	part def SignedServiceUnlockTokenVerifier;

	part def PowerSubsystem {
		part mainsInput : MainsInput;
		part surgeAndBurstImmunityProtection : SurgeAndBurstImmunityProtection;
		part powerSupplyUnit : PowerSupplyUnit;
		part mainsDipHandler : MainsDipHandler;
	}

	part def MainsInput;
	part def SurgeAndBurstImmunityProtection;
	part def PowerSupplyUnit;
	part def MainsDipHandler;

	part def EnclosureAndThermalSubsystem {
		part chassis : Chassis;
		part coolingSystem : CoolingSystem;
		part temperatureSensorSet : TemperatureSensorSet;
	}

	part def Chassis;

	part def CoolingSystem {
		part fan : Fan;
		part fanController : FanController;
	}

	part def Fan;
	part def FanController;
	part def TemperatureSensorSet;

	part def CommissioningAndServiceSubsystem {
		part commissioningController : CommissioningController;
		part disabledDefaultManagementServices : DisabledDefaultManagementServices;
		part installerMonitoringInterface : InstallerMonitoringInterface;
		ref part productionDebugInterfaceLock : ProductionDebugInterfaceLock;
	}

	part def CommissioningController;
	part def DisabledDefaultManagementServices;
	part def InstallerMonitoringInterface;

	part embeddedCinemaAmplifier : EmbeddedCinemaAmplifier;
}
