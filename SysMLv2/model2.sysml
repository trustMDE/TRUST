package EmbeddedCinemaAmplifierModel {

	requirement def AudioProcessingRequirement {
		doc /* The amplifier shall provide deterministic digital signal processing for channel mapping, equalization, crossover, limiting, delay, and preset management. */
	}

	requirement def SevenChannelAmplificationRequirement {
		doc /* The amplifier shall provide seven active power amplifier channels and one spare amplifier channel. */
	}

	requirement def SafetyProtectionRequirement {
		doc /* The amplifier shall provide mains, thermal, mute, relay weld, abnormal load, surge, burst, and EMC protection functions. */
	}

	requirement def SecureManagementRequirement {
		doc /* The amplifier shall provide authenticated, role-based, auditable, and update-secure management interfaces. */
	}

	requirement def InstallerInterfaceRequirement {
		doc /* The amplifier shall provide installer-facing GPIO, commissioning, and monitoring interfaces. */
	}

	part def AudioInputStage {
		part analogInputReceiver : AnalogInputReceiver;
		part inputSignalConditioner : InputSignalConditioner;
		part adcBank : AdcBank;
	}

	part def AnalogInputReceiver;
	part def InputSignalConditioner;
	part def AdcBank;

	part def NetworkInputStage {
		part networkAudioReceiver : NetworkAudioReceiver;
		part clockSynchronizationService : ClockSynchronizationService;
		part packetBuffer : PacketBuffer;
	}

	part def NetworkAudioReceiver;
	part def ClockSynchronizationService;
	part def PacketBuffer;

	part def ManagementNetworkInterface {
		part managementPort : ManagementPort;
		part remoteManagementService : RemoteManagementService;
		part networkConfigurationService : NetworkConfigurationService;
		part serviceAccessGateway : ServiceAccessGateway;
	}

	part def ManagementPort;
	part def RemoteManagementService;
	part def NetworkConfigurationService;
	part def ServiceAccessGateway;

	part def DigitalSignalProcessingStage {
		part channelMapper : ChannelMapper;
		part equalizerBank : EqualizerBank;
		part crossoverProcessor : CrossoverProcessor;
		part limiterBank : LimiterBank;
		part delayProcessor : DelayProcessor;
		part presetManager : PresetManager;
	}

	part def ChannelMapper;
	part def EqualizerBank;
	part def CrossoverProcessor;
	part def LimiterBank;
	part def DelayProcessor;

	part def PresetManager {
		part lockedLoudspeakerPresets : LoudspeakerPresetStore;
		part rollbackStore : PresetRollbackStore;
	}

	part def LoudspeakerPresetStore;
	part def PresetRollbackStore;

	part def AmplifierPowerStage {
		part amplifierChannel_1 : PowerAmplifierChannel;
		part amplifierChannel_2 : PowerAmplifierChannel;
		part amplifierChannel_3 : PowerAmplifierChannel;
		part amplifierChannel_4 : PowerAmplifierChannel;
		part amplifierChannel_5 : PowerAmplifierChannel;
		part amplifierChannel_6 : PowerAmplifierChannel;
		part amplifierChannel_7 : PowerAmplifierChannel;
		part spareAmplifierChannel_8 : SpareAmplifierChannel;
	}

	part def PowerAmplifierChannel {
		part loadMonitor : LoadMonitor;
		part protectionLimiter : ProtectionLimiter;
		part outputRelay : OutputRelay;
	}

	part def SpareAmplifierChannel :> PowerAmplifierChannel {
		part spareChannelIsolation : SpareChannelIsolation;
	}

	part def LoadMonitor;
	part def ProtectionLimiter;
	part def OutputRelay;
	part def SpareChannelIsolation;

	part def PowerAndSafetySubsystem {
		part mainsInputProtection : MainsInputProtection;
		part thermalManagement : ThermalManagement;
		part emergencyMuteCircuit : EmergencyMuteCircuit;
		part relayWeldDetection : RelayWeldDetection;
		part abnormalLoadProtection : AbnormalLoadProtection;
		part surgeBurstImmunityProtection : SurgeBurstImmunityProtection;
		part emcPreComplianceBoundary : EmcPreComplianceBoundary;
	}

	part def MainsInputProtection;

	part def ThermalManagement {
		part fanAssembly : FanAssembly;
		part temperatureSensorSet : TemperatureSensorSet;
	}

	part def FanAssembly;
	part def TemperatureSensorSet;
	part def EmergencyMuteCircuit;
	part def RelayWeldDetection;
	part def AbnormalLoadProtection;
	part def SurgeBurstImmunityProtection;
	part def EmcPreComplianceBoundary;

	part def ControlSoftwareSubsystem {
		part audioThread : AudioThread;
		part routingStateMachine : RoutingStateMachine;
		part watchdogService : WatchdogService;
		part secureUpdateService : SecureUpdateService;
		part faultManager : FaultManager;
	}

	part def AudioThread;
	part def RoutingStateMachine;
	part def WatchdogService;
	part def SecureUpdateService;
	part def FaultManager;

	part def CybersecuritySubsystem {
		part credentialManager : CredentialManager;
		part roleBasedAccessControl : RoleBasedAccessControl;
		part lockoutManager : LockoutManager;
		part auditLogger : AuditLogger;
		part certificateStore : CertificateStore;
		part debugLockController : DebugLockController;
		part signedServiceUnlockTokenVerifier : SignedServiceUnlockTokenVerifier;
		part networkAttackResilienceGuard : NetworkAttackResilienceGuard;
	}

	part def CredentialManager;
	part def RoleBasedAccessControl;
	part def LockoutManager;
	part def AuditLogger;
	part def CertificateStore;
	part def DebugLockController;
	part def SignedServiceUnlockTokenVerifier;
	part def NetworkAttackResilienceGuard;

	part def InstallerInterfaceSubsystem {
		part gpioInterface : GpioInterface;
		part commissioningInterface : CommissioningInterface;
		part monitoringInterface : MonitoringInterface;
	}

	part def GpioInterface;
	part def CommissioningInterface;
	part def MonitoringInterface;

	part def EmbeddedCinemaAmplifier {
		part audioInputStage : AudioInputStage;
		part networkInputStage : NetworkInputStage;
		part managementNetworkInterface : ManagementNetworkInterface;
		part digitalSignalProcessingStage : DigitalSignalProcessingStage;
		part amplifierPowerStage : AmplifierPowerStage;
		part powerAndSafetySubsystem : PowerAndSafetySubsystem;
		part controlSoftwareSubsystem : ControlSoftwareSubsystem;
		part cybersecuritySubsystem : CybersecuritySubsystem;
		part installerInterfaceSubsystem : InstallerInterfaceSubsystem;

		requirement audioProcessingRequirement : AudioProcessingRequirement;
		requirement sevenChannelAmplificationRequirement : SevenChannelAmplificationRequirement;
		requirement safetyProtectionRequirement : SafetyProtectionRequirement;
		requirement secureManagementRequirement : SecureManagementRequirement;
		requirement installerInterfaceRequirement : InstallerInterfaceRequirement;
	}

	part embeddedCinemaAmplifier : EmbeddedCinemaAmplifier;
}
