import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../cubit/document_cubit.dart';
import '../widgets/widgets/custom_doc_card.dart';
import '../widgets/widgets/upload_file_widget.dart';

class DocsScreen extends StatefulWidget {
  const DocsScreen({super.key});

  @override
  State<DocsScreen> createState() => _DocsScreenState();
}

class _DocsScreenState extends State<DocsScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DocumentsCubit>().getDocuments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColors.lightBackground,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: SvgPicture.asset(
            "assets/icons/back_arrow.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              AppColors.onPrimaryFixed,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          "Documents",
          style: AppTextStyles.font20SemiBold.copyWith(
            color: AppColors.onPrimaryFixed,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            UploadFileWidget(),
            25.ph,

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "My documents",
                style: AppTextStyles.font20Regular.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),

            10.ph,

            Expanded(
              child: BlocBuilder<DocumentsCubit, DocumentsState>(
                builder: (context, state) {
                  if (state is DocumentsLoading) {
                    return Center(
                      child:
                      Lottie.asset("assets/animations/Heart_Loading.json"),
                    );
                  }

                  if (state is DocumentsSuccess) {
                    if (state.documents.isEmpty) {
                      return Center(child: Text("No documents yet",
                        style: AppTextStyles.font16Medium.copyWith(
                          color: AppColors.onBackgroundLight,
                        ),
                      ));
                    }

                    return ListView.builder(
                      itemCount: state.documents.length,
                      itemBuilder: (context, index) {
                        final doc = state.documents[index];

                        return CustomDocCard(
                          document: doc,
                          onDelete: () {
                            context
                                .read<DocumentsCubit>()
                                .deleteDocument(doc.id);
                          },
                        );
                      },
                    );
                  }

                  if (state is DocumentsError) {
                    return Center(child: Text(state.message));
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
