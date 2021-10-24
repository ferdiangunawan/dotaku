class HeroState {
	final bool isLoading;
	final String? error;
	  
	const HeroState({
		this.isLoading = false,
		this.error,
	});
	  
	HeroState copyWith({
		bool? isLoading,
		String? error,
	}) {
		return HeroState(
			isLoading: isLoading ?? this.isLoading,
			error: error ?? this.error,
		);
	}
}
