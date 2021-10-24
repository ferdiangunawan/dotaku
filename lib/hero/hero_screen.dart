import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dotaku/hero/hero_cubit.dart';
import 'package:dotaku/hero/hero_state.dart';

class HeroScreen extends StatefulWidget {
	const HeroScreen({Key? key}) : super(key: key);
	
	@override
	_HeroScreenState createState() => _HeroScreenState();
}
	
class _HeroScreenState extends State<HeroScreen> {
	final screenCubit = HeroCubit();
	
	@override
	void initState() {
		screenCubit.loadInitialData();
		super.initState();
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: BlocConsumer<HeroCubit, HeroState>(
				bloc: screenCubit,
				listener: (BuildContext context, HeroState state) {
					if (state.error != null) {
						// TODO your code here
					}
				},
				builder: (BuildContext context, HeroState state) {
					if (state.isLoading) {
						return Center(child: CircularProgressIndicator());
					}
	
					return buildBody(state);
				},
			),
		);
	}
	
	Widget buildBody(HeroState state) {
		return ListView(
			children: [
				// TODO your code here
			],
		);
	}
}
