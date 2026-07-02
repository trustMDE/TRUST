package CinemaAmplifierEndpointModel {

	part def CinemaAmplifierEndpoint;

	part def AudioInputSubsystem;
	part def NetworkAudioInput;
	part def AnalogAudioInput;
	part def DigitalAudioInput;
	part def ChannelMappingUnit;

	part def AudioProcessingSubsystem;
	part def DSPCore;
	part def EQProcessor;
	part def DelayProcessor;
	part def CrossoverProcessor;
	part def LimiterProcessor;
	part def PresetManager;

	part def PowerAmplificationSubsystem;
	part def AmplifierBoard8Channel;
	part def AmplifierChannel;
	part def SpareAmplifierChannel;

	part def OutputSubsystem;
	part def SpeakerOutput;

	part def ProtectionSubsystem;
	part def LoadMonitor;
	part def ThermalMonitor;
	part def FanController;
	part def EmergencyMute;
	part def RelayWeldDetector;

	part def PowerSubsystem;
	part def MainsInput;
	part def PowerSupply;
	part def EnergyManagementUnit;

	part def ControlSubsystem;
	part def EmbeddedController;
	part def AudioThread;
	part def ManagementThread;
	part def Watchdog;
	part def GPIOInterface;
	part def HealthReportingService;
	part def FleetManagementService;

	part def CybersecuritySubsystem;
	part def CommissioningGate;
	part def TLSAccessService;
	part def CertificateStore;
	part def RoleBasedAccountManager;
	part def LockoutManager;
	part def AuditLogger;
	part def SecureUpdateManager;
	part def DebugAccessController;
	part def SignedServiceTokenVerifier;

	part def SafetyVerificationSubsystem;
	part def HardwareSafetyTestSet;
	part def EMCPreComplianceTestSet;
	part def SurgeBurstImmunityTestSet;
	part def AbnormalLoadTestSet;

	requirement def AudioProcessingRequirement {
		doc /* The endpoint shall process mapped cinema audio channels using equalization, delay, crossover, and limiting functions. */
	}

	requirement def AmplificationRequirement {
		doc /* The endpoint shall provide amplification for left, center, right, surround, back surround, and LFE speaker outputs. */
	}

	requirement def ProtectionRequirement {
		doc /* The endpoint shall monitor load and thermal conditions and shall support emergency mute and relay weld detection. */
	}

	requirement def PowerManagementRequirement {
		doc /* The endpoint shall manage mains input, power conversion, and energy management functions. */
	}

	requirement def ControlAndHealthRequirement {
		doc /* The endpoint shall provide embedded control, watchdog supervision, GPIO interfacing, health reporting, and fleet management. */
	}

	requirement def CybersecurityRequirement {
		doc /* The endpoint shall enforce commissioning control, TLS access, certificate storage, role-based accounts, lockout, audit logging, secure update, and controlled debug access. */
	}

	requirement def SafetyVerificationRequirement {
		doc /* The endpoint shall support hardware safety, EMC pre-compliance, surge and burst immunity, and abnormal load verification. */
	}

	requirement audioProcessingRequirement : AudioProcessingRequirement;
	requirement amplificationRequirement : AmplificationRequirement;
	requirement protectionRequirement : ProtectionRequirement;
	requirement powerManagementRequirement : PowerManagementRequirement;
	requirement controlAndHealthRequirement : ControlAndHealthRequirement;
	requirement cybersecurityRequirement : CybersecurityRequirement;
	requirement safetyVerificationRequirement : SafetyVerificationRequirement;

	part cinemaAmplifierEndpoint : CinemaAmplifierEndpoint {

		part audioInputSubsystem : AudioInputSubsystem {
			part networkAudioInput : NetworkAudioInput;
			part analogAudioInput : AnalogAudioInput;
			part digitalAudioInput : DigitalAudioInput;
			part channelMappingUnit : ChannelMappingUnit;
		}

		part audioProcessingSubsystem : AudioProcessingSubsystem {
			part dspCore : DSPCore {
				part eqProcessor : EQProcessor;
				part delayProcessor : DelayProcessor;
				part crossoverProcessor : CrossoverProcessor;
				part limiterProcessor : LimiterProcessor;
			}
			part presetManager : PresetManager;
		}

		part powerAmplificationSubsystem : PowerAmplificationSubsystem {
			part amplifierBoard8Channel : AmplifierBoard8Channel {
				part leftChannel : AmplifierChannel;
				part centerChannel : AmplifierChannel;
				part rightChannel : AmplifierChannel;
				part leftSurroundChannel : AmplifierChannel;
				part rightSurroundChannel : AmplifierChannel;
				part leftBackSurroundChannel : AmplifierChannel;
				part lfeChannel : AmplifierChannel;
				part spareChannel : SpareAmplifierChannel;
			}
		}

		part outputSubsystem : OutputSubsystem {
			part leftSpeakerOutput : SpeakerOutput;
			part centerSpeakerOutput : SpeakerOutput;
			part rightSpeakerOutput : SpeakerOutput;
			part leftSurroundSpeakerOutput : SpeakerOutput;
			part rightSurroundSpeakerOutput : SpeakerOutput;
			part leftBackSurroundSpeakerOutput : SpeakerOutput;
			part lfeSpeakerOutput : SpeakerOutput;
		}

		part protectionSubsystem : ProtectionSubsystem {
			part loadMonitor : LoadMonitor;
			part thermalMonitor : ThermalMonitor;
			part fanController : FanController;
			part emergencyMute : EmergencyMute;
			part relayWeldDetector : RelayWeldDetector;
		}

		part powerSubsystem : PowerSubsystem {
			part mainsInput : MainsInput;
			part powerSupply : PowerSupply;
			part energyManagementUnit : EnergyManagementUnit;
		}

		part controlSubsystem : ControlSubsystem {
			part embeddedController : EmbeddedController {
				part audioThread : AudioThread;
				part managementThread : ManagementThread;
				part watchdog : Watchdog;
			}
			part gpioInterface : GPIOInterface;
			part healthReportingService : HealthReportingService;
			part fleetManagementService : FleetManagementService;
		}

		part cybersecuritySubsystem : CybersecuritySubsystem {
			part commissioningGate : CommissioningGate;
			part tlsAccessService : TLSAccessService {
				part certificateStore : CertificateStore;
			}
			part roleBasedAccountManager : RoleBasedAccountManager;
			part lockoutManager : LockoutManager;
			part auditLogger : AuditLogger;
			part secureUpdateManager : SecureUpdateManager;
			part debugAccessController : DebugAccessController {
				part signedServiceTokenVerifier : SignedServiceTokenVerifier;
			}
		}

		part safetyVerificationSubsystem : SafetyVerificationSubsystem {
			part hardwareSafetyTestSet : HardwareSafetyTestSet;
			part emcPreComplianceTestSet : EMCPreComplianceTestSet;
			part surgeBurstImmunityTestSet : SurgeBurstImmunityTestSet;
			part abnormalLoadTestSet : AbnormalLoadTestSet;
		}
	}
}
