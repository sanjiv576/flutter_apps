// Mocks generated by Mockito 5.4.2 from annotations
// in hive_and_api_for_class/test/unit_test/batch_unit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:dartz/dartz.dart' as _i3;
import 'package:flutter/foundation.dart' as _i5;
import 'package:flutter/src/widgets/framework.dart' as _i4;
import 'package:flutter/src/widgets/notification_listener.dart' as _i10;
import 'package:hive_and_api_for_class/core/failure/failure.dart' as _i8;
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart'
    as _i9;
import 'package:hive_and_api_for_class/features/batch/domain/repository/batch_repository.dart'
    as _i2;
import 'package:hive_and_api_for_class/features/batch/domain/use_case/batch_use_case.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIBatchRepository_0 extends _i1.SmartFake
    implements _i2.IBatchRepository {
  _FakeIBatchRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWidget_2 extends _i1.SmartFake implements _i4.Widget {
  _FakeWidget_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i5.DiagnosticLevel? minLevel = _i5.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeInheritedWidget_3 extends _i1.SmartFake
    implements _i4.InheritedWidget {
  _FakeInheritedWidget_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({_i5.DiagnosticLevel? minLevel = _i5.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeDiagnosticsNode_4 extends _i1.SmartFake
    implements _i5.DiagnosticsNode {
  _FakeDiagnosticsNode_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );

  @override
  String toString({
    _i5.TextTreeConfiguration? parentConfiguration,
    _i5.DiagnosticLevel? minLevel = _i5.DiagnosticLevel.info,
  }) =>
      super.toString();
}

/// A class which mocks [BatchUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockBatchUseCase extends _i1.Mock implements _i6.BatchUseCase {
  @override
  _i2.IBatchRepository get batchRepository => (super.noSuchMethod(
        Invocation.getter(#batchRepository),
        returnValue: _FakeIBatchRepository_0(
          this,
          Invocation.getter(#batchRepository),
        ),
        returnValueForMissingStub: _FakeIBatchRepository_0(
          this,
          Invocation.getter(#batchRepository),
        ),
      ) as _i2.IBatchRepository);
  @override
  _i7.Future<_i3.Either<_i8.Failure, List<_i9.BatchEntity>>> getAllBatches() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllBatches,
          [],
        ),
        returnValue:
            _i7.Future<_i3.Either<_i8.Failure, List<_i9.BatchEntity>>>.value(
                _FakeEither_1<_i8.Failure, List<_i9.BatchEntity>>(
          this,
          Invocation.method(
            #getAllBatches,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i3.Either<_i8.Failure, List<_i9.BatchEntity>>>.value(
                _FakeEither_1<_i8.Failure, List<_i9.BatchEntity>>(
          this,
          Invocation.method(
            #getAllBatches,
            [],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, List<_i9.BatchEntity>>>);
  @override
  _i7.Future<_i3.Either<_i8.Failure, bool>> addBatch(_i9.BatchEntity? batch) =>
      (super.noSuchMethod(
        Invocation.method(
          #addBatch,
          [batch],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, bool>>.value(
            _FakeEither_1<_i8.Failure, bool>(
          this,
          Invocation.method(
            #addBatch,
            [batch],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i3.Either<_i8.Failure, bool>>.value(
                _FakeEither_1<_i8.Failure, bool>(
          this,
          Invocation.method(
            #addBatch,
            [batch],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, bool>>);
  @override
  _i7.Future<_i3.Either<_i8.Failure, bool>> deleteBatch(String? batchId) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteBatch,
          [batchId],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, bool>>.value(
            _FakeEither_1<_i8.Failure, bool>(
          this,
          Invocation.method(
            #deleteBatch,
            [batchId],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i3.Either<_i8.Failure, bool>>.value(
                _FakeEither_1<_i8.Failure, bool>(
          this,
          Invocation.method(
            #deleteBatch,
            [batchId],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, bool>>);
  @override
  _i7.Future<_i3.Either<_i8.Failure, bool>> updateBatch(
    String? batchId,
    _i9.BatchEntity? batch,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateBatch,
          [
            batchId,
            batch,
          ],
        ),
        returnValue: _i7.Future<_i3.Either<_i8.Failure, bool>>.value(
            _FakeEither_1<_i8.Failure, bool>(
          this,
          Invocation.method(
            #updateBatch,
            [
              batchId,
              batch,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i7.Future<_i3.Either<_i8.Failure, bool>>.value(
                _FakeEither_1<_i8.Failure, bool>(
          this,
          Invocation.method(
            #updateBatch,
            [
              batchId,
              batch,
            ],
          ),
        )),
      ) as _i7.Future<_i3.Either<_i8.Failure, bool>>);
}

/// A class which mocks [BuildContext].
///
/// See the documentation for Mockito's code generation for more information.
class MockBuildContext extends _i1.Mock implements _i4.BuildContext {
  @override
  _i4.Widget get widget => (super.noSuchMethod(
        Invocation.getter(#widget),
        returnValue: _FakeWidget_2(
          this,
          Invocation.getter(#widget),
        ),
        returnValueForMissingStub: _FakeWidget_2(
          this,
          Invocation.getter(#widget),
        ),
      ) as _i4.Widget);
  @override
  bool get mounted => (super.noSuchMethod(
        Invocation.getter(#mounted),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  bool get debugDoingBuild => (super.noSuchMethod(
        Invocation.getter(#debugDoingBuild),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  _i4.InheritedWidget dependOnInheritedElement(
    _i4.InheritedElement? ancestor, {
    Object? aspect,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #dependOnInheritedElement,
          [ancestor],
          {#aspect: aspect},
        ),
        returnValue: _FakeInheritedWidget_3(
          this,
          Invocation.method(
            #dependOnInheritedElement,
            [ancestor],
            {#aspect: aspect},
          ),
        ),
        returnValueForMissingStub: _FakeInheritedWidget_3(
          this,
          Invocation.method(
            #dependOnInheritedElement,
            [ancestor],
            {#aspect: aspect},
          ),
        ),
      ) as _i4.InheritedWidget);
  @override
  void visitAncestorElements(_i4.ConditionalElementVisitor? visitor) =>
      super.noSuchMethod(
        Invocation.method(
          #visitAncestorElements,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void visitChildElements(_i4.ElementVisitor? visitor) => super.noSuchMethod(
        Invocation.method(
          #visitChildElements,
          [visitor],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispatchNotification(_i10.Notification? notification) =>
      super.noSuchMethod(
        Invocation.method(
          #dispatchNotification,
          [notification],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.DiagnosticsNode describeElement(
    String? name, {
    _i5.DiagnosticsTreeStyle? style = _i5.DiagnosticsTreeStyle.errorProperty,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeElement,
          [name],
          {#style: style},
        ),
        returnValue: _FakeDiagnosticsNode_4(
          this,
          Invocation.method(
            #describeElement,
            [name],
            {#style: style},
          ),
        ),
        returnValueForMissingStub: _FakeDiagnosticsNode_4(
          this,
          Invocation.method(
            #describeElement,
            [name],
            {#style: style},
          ),
        ),
      ) as _i5.DiagnosticsNode);
  @override
  _i5.DiagnosticsNode describeWidget(
    String? name, {
    _i5.DiagnosticsTreeStyle? style = _i5.DiagnosticsTreeStyle.errorProperty,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeWidget,
          [name],
          {#style: style},
        ),
        returnValue: _FakeDiagnosticsNode_4(
          this,
          Invocation.method(
            #describeWidget,
            [name],
            {#style: style},
          ),
        ),
        returnValueForMissingStub: _FakeDiagnosticsNode_4(
          this,
          Invocation.method(
            #describeWidget,
            [name],
            {#style: style},
          ),
        ),
      ) as _i5.DiagnosticsNode);
  @override
  List<_i5.DiagnosticsNode> describeMissingAncestor(
          {required Type? expectedAncestorType}) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeMissingAncestor,
          [],
          {#expectedAncestorType: expectedAncestorType},
        ),
        returnValue: <_i5.DiagnosticsNode>[],
        returnValueForMissingStub: <_i5.DiagnosticsNode>[],
      ) as List<_i5.DiagnosticsNode>);
  @override
  _i5.DiagnosticsNode describeOwnershipChain(String? name) =>
      (super.noSuchMethod(
        Invocation.method(
          #describeOwnershipChain,
          [name],
        ),
        returnValue: _FakeDiagnosticsNode_4(
          this,
          Invocation.method(
            #describeOwnershipChain,
            [name],
          ),
        ),
        returnValueForMissingStub: _FakeDiagnosticsNode_4(
          this,
          Invocation.method(
            #describeOwnershipChain,
            [name],
          ),
        ),
      ) as _i5.DiagnosticsNode);
}
